import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/video/failures.dart';
import 'package:video_app/domain/video/i_video_repository.dart';
import 'package:video_app/domain/video/video.dart';
import 'package:video_app/domain/video/video_event.dart';

part 'video_list_cubit.freezed.dart';

part 'video_list_state.dart';

///VideoListCubit is needed to control the VideoListScreen view
@lazySingleton
class VideoListCubit extends Cubit<VideoListState> {
  ///When VideoListScreen starts to display, VideoListCubit takes a loading state to inform the user that the Video List is about
  /// to be loaded
  VideoListCubit(this._repository, this._videoDataListReceiver, this._realtime) : super(VideoListState.loading()) {
    _subscription = _realtime.subscribe(<String>['databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents']);
  }

  late final RealtimeSubscription _subscription;
  final Realtime _realtime;
  final IVideoRepository _repository;
  final VideoDataListReceiver _videoDataListReceiver;

  ///method for subscription on video event file
  void subscriptionOnVideoEvent() {
    _subscription.stream.listen(
      (RealtimeMessage response) {
        if (response.events.contains('databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.*.create')) {
          emit(
            state.copyWith(
              event: optionOf(const VideoEvent.newVideo()),
              videoListFailureOrSuccessOption: none(),
            ),
          );
          _getVideoListFromTheServer();
        }

        if (response.events.contains('databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.*.update')) {
          emit(
            state.copyWith(
              event: optionOf(const VideoEvent.updated()),
              videoListFailureOrSuccessOption: none(),
            ),
          );
          _getVideoListFromTheServer();
        }

        if (response.events.contains('databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.*.delete')) {
          emit(
            state.copyWith(
              event: optionOf(const VideoEvent.deleted()),
              videoListFailureOrSuccessOption: none(),
            ),
          );
          _getVideoListFromTheServer();
        }
      },
    );
  }

  ///Used when VideoListScreen starts to display
  Future<void> initialList() async {
    subscriptionOnVideoEvent();
    _getVideoListFromTheServer();
  }

  ///Used when needed update video list
  Future<void> updateList() async {
    emit(VideoListState.loading());
    await _getVideoListFromTheServer();
  }

  Future<void> _getVideoListFromTheServer() async {
    final Either<Failure, VideoDataList> videoListOrFailure = await _repository.getVideoList();

    videoListOrFailure.fold(
      (Failure l) => l.maybeWhen(
        serverError: () => emit(
          state.copyWith(
            event: none(),
            loading: false,
          ),
        ),
        orElse: () => null,
      ),
      (VideoDataList newVideoDataList) {
        _videoDataListReceiver.getVideoDataList(newVideoDataList);
        emit(VideoListState.listDisplayed());
      },
    );

    emit(
      state.copyWith(
        event: none(),
        videoListFailureOrSuccessOption: optionOf(videoListOrFailure),
      ),
    );
  }
}
