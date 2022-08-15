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
import 'package:video_app/domain/failures.dart';
import 'package:video_app/domain/i_video_repository.dart';
import 'package:video_app/ui/core/snackbar_custom.dart';
import 'package:video_app/ui/video/player_widget.dart';
import 'package:video_player/video_player.dart';

part 'video_cubit.freezed.dart';

part 'video_state.dart';

///cubit for manipulation on video_screen
@Injectable()
class VideoCubit extends Cubit<VideoState> {
  ///Storage need to update and delete video on the server
  VideoCubit(this._repository, this._account) : super(VideoState.initial());

  final IVideoRepository _repository;
  final Account _account;

  ///need to init video on create screen
  void init(String? id) {
    if (kIsWeb) {
      emit(
        state.copyWith(
          linkVideo:
              'http://localhost/v1/storage/buckets/62e3f62d96bf680e817c/files/$id/view?project=62e3e3500061cd4fb81d&mode=admin',
        ),
      );
    }
  }

  ///needed to return the state when return to the video_list_screen
  void displayVideo() {
    emit(state.copyWith(videoStatus: VideoStatus.loaded));
  }

  ///method to get video from the server and write as bytes
  Future<File> getVideoFile(String fileId) async {
    final Either<Failure, Uint8List> fileBytesOrFailure = await _repository.getVideoFromTheServer(fileId);
    Directory? directory;
    late File videoFile;
    if (fileBytesOrFailure.isRight()) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      videoFile = File('${directory!.path}/$fileId.mp4');
      videoFile.writeAsBytesSync(<int>[] as List<int>);
    }

    fileBytesOrFailure.fold(
      (Failure l) => _serverErrorShowMessage(),
      (Uint8List r) {
        videoFile = File('${directory!.path}/$fileId.mp4');
        videoFile.writeAsBytesSync(r as List<int>);
      },
    );

    return videoFile;
  }

  ///method to update video on the server
  Future<void> updateVideo({
    required String fileId,
    required String fileName,
  }) async {
    final FilePickerResult? filePickerResult = await pickFile();

    if (filePickerResult != null) {
      emit(state.copyWith(videoStatus: VideoStatus.loading));

      await _account.createAnonymousSession();

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

      await _account.deleteSessions();

      emit(
        state.copyWith(
          linkVideo: '${state.linkVideo}  ',
          videoStatus: VideoStatus.loaded,
        ),
      );
    }
  }

  ///method to delete video on the server
  Future<void> deleteVideo(String fileId) async {
    emit(state.copyWith(videoStatus: VideoStatus.loading));

    await _account.createAnonymousSession();

    final Either<Failure, Unit> resultOrFailure = await _repository.deleteVideoOnServer(fileId);
    resultOrFailure.fold(
      (Failure failure) => failure.when(
        serverError: () => _serverErrorShowMessage(),
      ),
      (Unit r) {
        showSnackWithText('File delete on the server');
      },
    );

    await _account.deleteSessions();

    emit(state.copyWith(videoStatus: VideoStatus.loaded));

    await Future<void>.delayed(const Duration(seconds: 1));
  }
}

void _serverErrorShowMessage() => showSnackWithText('Server Error');
