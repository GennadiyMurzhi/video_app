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
    required String videoDescription,
    required String videoFileId,
    required String userId,
    required String userName,
    required int likesCount,
    required int dislikesCount,
    required bool isUserLiked,
    required bool isUserDisliked,
    required bool isAppUserSubscribe,
    Uint8List? userPhotoBits,
    required ChewieController? chewieController,
    required Option<Either<Failure, Success>> videoFailureOrSuccessOption,
  }) = _VideoState;

  ///this state is need to create cubit
  factory VideoState.initial() => VideoState(
        videoStatus: VideoStatus.loading,
        videoName: '',
        videoDescription: '',
        videoFileId: '',
        userId: '',
        userName: '',
        chewieController: null,
        isUserLiked: false,
        isUserDisliked: false,
        isAppUserSubscribe: false,
        videoFailureOrSuccessOption: none(),
        likesCount: 0,
        dislikesCount: 0,
      );
}
