import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/application/pick_file.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/video/failures.dart';
import 'package:video_app/domain/video/i_video_repository.dart';
import 'package:video_app/domain/video/video.dart';
import 'package:video_app/ui/core/snackbar_custom.dart';

part 'video_list_cubit.freezed.dart';
part 'video_list_state.dart';

///VideoListCubit is needed to control the VideoListScreen view
@Injectable()
class VideoListCubit extends Cubit<VideoListState> {
  ///When VideoListScreen starts to display, VideoListCubit takes a loading state to inform the user that the Video List is about
  /// to be loaded
  VideoListCubit(this._repository, this._videoDataListReceiver) : super(VideoListState.loading());

  final IVideoRepository _repository;
  final VideoDataListReceiver _videoDataListReceiver;

  ///Used when VideoListScreen starts to display
  Future<void> initialList() async {
    final Either<Failure, VideoDataList> videoListOrFailure = await _repository.getVideoList();

    videoListOrFailure.fold(
      (Failure l) => l.when(
        serverError: () => _serverErrorShowMessage(),
      ),
      (VideoDataList newVideoDataList) {
        _videoDataListReceiver.getVideoDataList(newVideoDataList);
        emit(VideoListState.listDisplayed());
      },
    );
  }

  ///Used when needed update video list
  Future<void> updateList() async {
    emit(VideoListState.loading());
    await initialList();
  }

  /*
  ///method for pick video file
  Future<void> pickAndUploadVideo(String userId) async {
    final FilePickerResult? filePickerResult = await pickFile();

    if (filePickerResult != null) {
      emit(VideoListState.loading());

      final Either<Failure, Unit> resultOrFailure = await _repository.uploadVideoOnServer(
        filePickerResult: filePickerResult,
        userId: userId,

      );
      resultOrFailure.fold(
        (Failure failure) => failure.when(
          serverError: () => _serverErrorShowMessage(),
        ),
        (Unit r) {
          showSnackWithText('File uploaded to the server');
        },
      );

      emit(VideoListState.listDisplayed());
    }
  }*/
}

void _serverErrorShowMessage() => showSnackWithText('Server Error');
