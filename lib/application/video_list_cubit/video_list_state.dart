part of 'video_list_cubit.dart';

///State for VideoListCubit
@freezed
abstract class VideoListState with _$VideoListState {
  ///loading variable is used to display the load
  const factory VideoListState({
    required bool loading,
    required bool? isEvents,
  }) = _VideoListState;

  ///this state is used when needed to display that a video data list is being loaded from the server
  factory VideoListState.loading() => const VideoListState(
        loading: true,
        isEvents: null,
      );

  ///this state is used when needed to display a video data list
  factory VideoListState.listDisplayed() => const VideoListState(
        loading: false,
        isEvents: null,
      );
}
