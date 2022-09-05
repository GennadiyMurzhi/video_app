import 'dart:io';
import 'dart:typed_data';

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
import 'package:video_app/ui/core/snackbar_custom.dart';
import 'package:video_player/video_player.dart';

part 'video_cubit.freezed.dart';
part 'video_state.dart';

///cubit for manipulation on video_screen
@Injectable()
class VideoCubit extends Cubit<VideoState> {
  ///Storage need to update and delete video on the server
  VideoCubit(this._repository) : super(VideoState.initial());

  final IVideoRepository _repository;

  ///need to init video on create screen
  Future<void> init(String name, String id) async {
    if (kIsWeb) {
      final VideoPlayerController videoPlayerController = VideoPlayerController.network(_linkVideo(id));
      emit(
        state.copyWith(
          chewieController: ChewieController(videoPlayerController: videoPlayerController)..videoPlayerController.initialize(),
        ),
      );
    } else {
      emit(
        state.copyWith(videoStatus: VideoStatus.loading),
      );
      final Either<Failure, Uint8List> fileBytesOrFailure = await _repository.getVideoFromTheServer(id);
      Directory? directory;
      File videoFile;
      if (fileBytesOrFailure.isRight()) {
        directory = await getApplicationDocumentsDirectory();
      }

      fileBytesOrFailure.fold(
        (Failure l) => _serverErrorShowMessage(),
        (Uint8List r) {
          videoFile = File('${directory!.path}/$name.mp4');
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

    _crutchLinkVideo = _linkVideo(id);
  }

  ///needed to return the state when return to the video_list_screen
  void displayVideo() {
    emit(state.copyWith(videoStatus: VideoStatus.display));
  }

  ///method to update video on the server
  Future<void> updateVideo({
    required String fileId,
    required String fileName,
  }) async {
    final FilePickerResult? filePickerResult = await pickFile();

    if (filePickerResult != null) {
      emit(state.copyWith(videoStatus: VideoStatus.replacing));

      final Either<Failure, Unit> resultOrFailure = await _repository.replaceVideoOnServer(
        fileId: fileId,
        fileName: fileName,
        filePickerResult: filePickerResult,
      );
      resultOrFailure.fold(
        (Failure failure) => failure.when(
          serverError: () => _serverErrorShowMessage(),
        ),
        (Unit r) {
          showSnackWithText('File replaced on the server');
        },
      );

      if (!kIsWeb && resultOrFailure.isRight()) {
        File? videoFile;
        final Either<Failure, Uint8List> fileBytesOrFailure = await _repository.getVideoFromTheServer(fileId);
        if (fileBytesOrFailure.isRight()) {
          Directory directory = await getApplicationDocumentsDirectory();
          videoFile = File('${directory.path}/$fileName.mp4');
        }
        fileBytesOrFailure.fold(
          (Failure l) => _serverErrorShowMessage(),
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
    }
  }

  ///method to delete video on the server
  Future<void> deleteVideo(String fileId) async {
    emit(state.copyWith(videoStatus: VideoStatus.deleting));

    final Either<Failure, Unit> resultOrFailure = await _repository.deleteVideoOnServer(fileId);
    resultOrFailure.fold(
      (Failure failure) => failure.when(
        serverError: () => _serverErrorShowMessage(),
      ),
      (Unit r) {
        showSnackWithText('File delete on the server');
      },
    );

    emit(state.copyWith(videoStatus: VideoStatus.deleted));

    await Future<void>.delayed(const Duration(seconds: 1));
  }
}

void _serverErrorShowMessage() => showSnackWithText('Server Error');

String _crutchLinkVideo = '';

String _linkVideo(String id) =>
    'http://localhost/v1/storage/buckets/62e3f62d96bf680e817c/files/$id/view?project=62e3e3500061cd4fb81d&mode=admin';
