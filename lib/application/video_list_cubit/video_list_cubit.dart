import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/video/i_video_repository.dart';
import 'package:video_app/domain/video/video.dart';
import 'package:video_app/domain/video/video_event.dart';
import 'package:video_app/injectable.dart';

part 'video_list_cubit.freezed.dart';

part 'video_list_state.dart';

///VideoListCubit is needed to control the VideoListScreen view
@LazySingleton()
class VideoListCubit extends Cubit<VideoListState> {
  ///When VideoListScreen starts to display, VideoListCubit takes a loading state to inform the user that the Video List is about
  /// to be loaded
  VideoListCubit(this._repository, this._videoDataListReceiver, this._realtime) : super(VideoListState.loading());

  RealtimeSubscription? _subscription;
  final Realtime _realtime;
  final IVideoRepository _repository;
  final VideoDataListReceiver _videoDataListReceiver;

  ///method for subscription on video event file
  void subscriptionOnVideoEvent() {
    closeSubscription();
    _subscription = _realtime.subscribe(<String>[
      'databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents',
      'buckets.633c5933bd7ce6a7f5cb.files'
    ]);
    _subscription!.stream.listen(
      (RealtimeMessage response) {
        print('state.appUserId: ${state.appUserId}');
        if (response.events.contains('buckets.633c5933bd7ce6a7f5cb.files.*')) {
          getVideoListFromTheServer(appUserId: state.appUserId);
        }
        if (response.events
            .contains('databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.*.create')) {
          emit(
            state.copyWith(
              event: optionOf(const VideoEvent.newVideo()),
              videoListFailureOrSuccessOption: none(),
            ),
          );
          getVideoListFromTheServer(appUserId: state.appUserId);
        }

        if (response.events
            .contains('databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.*.update')) {
          emit(
            state.copyWith(
              event: optionOf(const VideoEvent.updated()),
              videoListFailureOrSuccessOption: none(),
            ),
          );
          getVideoListFromTheServer(appUserId: state.appUserId);
        }

        if (response.events
            .contains('databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.*.delete')) {
          emit(
            state.copyWith(
              event: optionOf(const VideoEvent.deleted()),
              videoListFailureOrSuccessOption: none(),
            ),
          );
          getVideoListFromTheServer(appUserId: state.appUserId);
        }
      },
    );
  }

  ///method to close subscription
  void closeSubscription() {
    if (_subscription != null) {
      _subscription!.close();
    }
  }

  ///method for subscription on upload video event file
  void _subscriptionOnUploadVideoEvent(String appUserId) {
    List<String> subscribeList;
    final List<VideoData> videoData = getIt<VideoDataListReceiver>().videoDataListStream.value.documents;
    subscribeList = List<String>.generate(
      videoData.length,
      (int index) =>
          'databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.${videoData[index].videoDataId}',
    );
    _subscription = _realtime.subscribe(subscribeList);

    _subscription!.stream.listen(
      (RealtimeMessage response) {
        getVideoListFromTheServer(appUserId: appUserId);
      },
    );
  }

  ///Used when VideoListScreen starts to display
  Future<void> initialList() async {
    emit(VideoListState.loading());
    closeSubscription();

    emit(state.copyWith(appUserId: null));
    subscriptionOnVideoEvent();
    getVideoListFromTheServer();
  }

  ///Used when VideoListScreen starts to display
  void initialUploadList() {
    if (!isClosed) {
      emit(VideoListState.loading());
    }
    closeSubscription();
    final String appUserId = getIt<UserCubit>().userId;
    if (!isClosed) {
      emit(state.copyWith(appUserId: appUserId));
    }
    getVideoListFromTheServer(appUserId: appUserId);
    _subscriptionOnUploadVideoEvent(appUserId);
  }

  ///Used when needed update video list
  Future<void> updateList() async {
    emit(VideoListState.loading());
    await getVideoListFromTheServer();
  }

  ///Used when needed update video list
  Future<void> updateUploadList() async {
    final String appUserId = getIt<UserCubit>().userId;

    emit(VideoListState.loading());

    await getVideoListFromTheServer(appUserId: appUserId);
  }

  Future<Either<Failure, VideoDataList>> downloadVideoList({String? appUserId}) async {
    final Either<Failure, VideoDataList> videoListOrFailure = await _repository.getVideoList(appUserId: appUserId);
    VideoDataList? videoDataList;
    videoListOrFailure.fold(
      (Failure l) => null,
      (VideoDataList newVideoDataList) {
        videoDataList = newVideoDataList;
      },
    );

    if (videoListOrFailure.isRight()) {
      await _videoDataListReceiver.getVideoDataList(videoDataList!);
    }
    return videoListOrFailure;
  }

  Future<void> getVideoListFromTheServer({String? appUserId}) async {
    final Either<Failure, VideoDataList> videoListOrFailure = await downloadVideoList(appUserId: appUserId);
    if (!isClosed) {
      emit(VideoListState.listDisplayed());
    }
    if(!isClosed) {
      emit(
        state.copyWith(
          loading: false,
          event: none(),
          videoListFailureOrSuccessOption: optionOf(videoListOrFailure),
        ),
      );
    }
  }

  ///method to get file preview
  Future<Uint8List?> getVideoPreview(String fileId) async {
    final Either<Failure, Uint8List> resultOrFailure = await _repository.getVideoPreviewFromTheServer(fileId);
    return resultOrFailure.fold(
      (Failure l) => null,
      (Uint8List photo) => photo,
    );
  }
}
