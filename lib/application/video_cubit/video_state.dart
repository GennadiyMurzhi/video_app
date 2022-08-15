part of 'video_cubit.dart';

///enum for determination video state
enum VideoStatus {
  ///use to indicate when video is loading
  loading,

  ///use to indicate when video loaded
  loaded,

  ///use to indicate when video deleted
  deleted,
}

///State of video_screen
@freezed
abstract class VideoState with _$VideoState {
  ///loading need to indicate when video is updating
  const factory VideoState({
    required VideoStatus videoStatus,
    required String? directoryPath,
    required String? linkVideo,
  }) = _VideoState;

  ///this state is need to create cubit
  factory VideoState.initial() => const VideoState(
        videoStatus: VideoStatus.loaded,
        directoryPath: null,
        linkVideo: null,
      );

/*
  ///this state is used when needed to display video
  factory VideoState.videoDisplayed() => const VideoState(
    videoStatus: VideoStatus.loaded,
  );

  ///this state is used when needed to display that video deleted
  factory VideoState.videoDeleted() => const VideoState(
    videoStatus: VideoStatus.deleted,
  );*/
}
