import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_app/application/pick_file.dart';
import 'package:video_app/domain/video/failures.dart';
import 'package:video_app/domain/video/i_video_repository.dart';
import 'package:video_app/domain/video/success.dart';
import 'package:video_app/domain/video/value_objects.dart';
import 'package:video_app/domain/video/video.dart';
import 'package:video_app/injectable.dart';
import 'package:video_player/video_player.dart';

part 'video_cubit.freezed.dart';

part 'video_state.dart';

///cubit for manipulation on video_screen
@Injectable()
class VideoCubit extends Cubit<VideoState> {
  ///Storage need to update and delete video on the server
  VideoCubit(this._repository, Client client) : super(VideoState.initial()) {
    _functions = Functions(client);
  }

  late final Functions _functions;
  final IVideoRepository _repository;
  RealtimeSubscription? _subscription;

  ///need to init video on create screen
  Future<void> init(String videoName, String videoFileId, String userId, String description) async {
    emit(
      state.copyWith(
        videoFileId: videoFileId,
        videoName: videoName,
        userId: userId,
        videoDescription: description,
      ),
    );

    _subscriptionOnUpdateVideoInformation();

    if (kIsWeb) {
      final VideoPlayerController videoPlayerController = VideoPlayerController.network(_linkVideo(state.videoFileId));
      emit(
        state.copyWith(
          chewieController: ChewieController(
            videoPlayerController: videoPlayerController,
          )..videoPlayerController.initialize(),
        ),
      );
    } else {
      emit(
        state.copyWith(
          videoStatus: VideoStatus.loading,
        ),
      );
      final Either<Failure, Uint8List> fileBytesOrFailure = await _repository.getVideoFromTheServer(state.videoFileId);
      Directory? directory;
      File videoFile;
      if (fileBytesOrFailure.isRight()) {
        directory = await getApplicationDocumentsDirectory();
      }

      fileBytesOrFailure.fold(
        (Failure l) => null, //_serverErrorShowMessage(),
        (Uint8List r) {
          videoFile = File('${directory!.path}/$videoName.mp4');
          videoFile.writeAsBytesSync(r as List<int>);
          final VideoPlayerController videoPlayerController = VideoPlayerController.file(videoFile);
          emit(
            state.copyWith(
              videoStatus: VideoStatus.display,
              chewieController: ChewieController(videoPlayerController: videoPlayerController)
                ..videoPlayerController.initialize(),
            ),
          );
        },
      );
    }

    _crutchLinkVideo = _linkVideo(state.videoFileId);
  }

  ///method to update comments for video
  void _subscriptionOnUpdateVideoInformation() {
    final String videoDataDocumentId = 'video_data_${state.videoFileId}';
    _subscription = getIt<Realtime>()
        .subscribe(<String>['databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.$videoDataDocumentId']);
    _subscription!.stream.listen(
      (RealtimeMessage response) async {
        if (response.events
            .contains('databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.$videoDataDocumentId.update')) {
          print('_subscriptionOnUpdateVideoInformation');
          _updateVideoInfo();
        }
      },
    );
  }

  Future<void> _updateVideoInfo() async {
    final Either<Failure, VideoData> documentOrFailure = await _repository.getDataForVideo('video_data_${state.videoFileId}');
    final Either<Failure, Success> editEiter = documentOrFailure.replace(const Success.videoInfoUpdated());
    documentOrFailure.fold(
      (Failure l) => emit(
        state.copyWith(
          videoFailureOrSuccessOption: optionOf(editEiter),
        ),
      ),
      (VideoData videoData) {
        print('documentOrFailure video data');
        print(videoData.name);
        print(videoData.description);
        emit(
          state.copyWith(
            videoName: videoData.name,
            videoDescription: videoData.description,
          ),
        );
      },
    );
  }

  ///needed to return the state when return to the video_list_screen
  void displayVideo() {
    emit(state.copyWith(videoStatus: VideoStatus.display));
  }

  ///method to update video on the server
  Future<Either<Failure, Success>> updateVideo() async {
    final FilePickerResult? filePickerResult = await pickFile();

    if (filePickerResult != null) {
      emit(
        state.copyWith(
          videoStatus: VideoStatus.replacing,
        ),
      );

      final Either<Failure, Success> resultOrFailure = await _repository.replaceVideoOnServer(
        userId: state.userId,
        fileId: state.videoFileId,
        fileName: state.videoFileId,
        filePickerResult: filePickerResult,
      );
      resultOrFailure.fold(
        (Failure failure) => failure.maybeWhen(
          serverError: () => emit(
            state.copyWith(
              videoStatus: VideoStatus.display,
            ),
          ),
          orElse: () => null,
        ),
        (Success r) => null,
      );

      emit(
        state.copyWith(
          videoFailureOrSuccessOption: optionOf(resultOrFailure),
        ),
      );

      if (!kIsWeb && resultOrFailure.isRight()) {
        File? videoFile;
        final Either<Failure, Uint8List> fileBytesOrFailure = await _repository.getVideoFromTheServer(state.videoFileId);
        if (fileBytesOrFailure.isRight()) {
          Directory directory = await getApplicationDocumentsDirectory();
          videoFile = File('${directory.path}/${state.videoFileId}.mp4');
        }
        fileBytesOrFailure.fold(
          (Failure l) => emit(
            state.copyWith(
              videoStatus: VideoStatus.display,
            ),
          ),
          (Uint8List r) {
            videoFile!.writeAsBytesSync(r as List<int>);

            final VideoPlayerController videoPlayerController = VideoPlayerController.file(videoFile);

            emit(
              state.copyWith(
                videoStatus: VideoStatus.display,
                chewieController: ChewieController(videoPlayerController: videoPlayerController)
                  ..videoPlayerController.initialize(),
              ),
            );
          },
        );

        emit(
          state.copyWith(
            videoFailureOrSuccessOption: optionOf(resultOrFailure),
          ),
        );
      }

      if (kIsWeb && resultOrFailure.isRight()) {
        _crutchLinkVideo = '$_crutchLinkVideo/';
        final VideoPlayerController videoPlayerController = VideoPlayerController.network(_crutchLinkVideo)..initialize();

        emit(
          state.copyWith(
            videoStatus: VideoStatus.display,
            chewieController: ChewieController(videoPlayerController: videoPlayerController),
          ),
        );
      }

      return resultOrFailure;
    }
    return left(const Failure.fileNotChoose());
  }

  ///method to delete video on the server
  Future<Either<Failure, Success>> deleteVideo() async {
    emit(state.copyWith(videoStatus: VideoStatus.deleting));

    final Either<Failure, Success> resultOrFailure = await _repository.deleteVideoOnServer(state.videoFileId);
    resultOrFailure.fold(
        (Failure failure) => failure.maybeWhen(
              serverError: () => emit(
                state.copyWith(videoStatus: VideoStatus.display),
              ),
              orElse: () => null,
            ), (Success r) async {
      await _functions.createExecution(
        functionId: 'onDeleteVideo',
        data: jsonEncode({
          'video_id': state.videoFileId,
        }),
      );
      emit(
        state.copyWith(
          videoStatus: VideoStatus.deleted,
        ),
      );
    });

    emit(
      state.copyWith(
        videoFailureOrSuccessOption: optionOf(resultOrFailure),
      ),
    );

    return resultOrFailure;
  }
}

//void _serverErrorShowMessage() => showSnackWithText('Server Error');

String _crutchLinkVideo = '';

String _linkVideo(String id) =>
    'http://localhost/v1/storage/buckets/62e3f62d96bf680e817c/files/$id/view?project=62e3e3500061cd4fb81d&mode=admin';
