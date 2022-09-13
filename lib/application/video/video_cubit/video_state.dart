part of 'video_cubit.dart';

///enum for determination video state
enum VideoStatus {
  ///use to indicate when video is loading
  loading,

  ///use to indicate when video is loading
  replacing,

  ///use to indicate when video is loading
  deleting,

  ///use to indicate when video loaded
  display,

  ///use to indicate when video deleted
  deleted,
}

///State of video_screen
@freezed
abstract class VideoState with _$VideoState {
  ///loading need to indicate when video is updating
  const factory VideoState({
    required VideoStatus videoStatus,
    required String videoName,
    required String videoFileId,
    required String userId,
    required ChewieController? chewieController,
    required Option<Either<Failure, Success>> videoFailureOrSuccessOption,
  }) = _VideoState;

  ///this state is need to create cubit
  factory VideoState.initial() => VideoState(
        videoStatus: VideoStatus.display,
        videoName: '',
        videoFileId: '',
        userId: '',
        chewieController: null,
        videoFailureOrSuccessOption: none(),
      );
}
