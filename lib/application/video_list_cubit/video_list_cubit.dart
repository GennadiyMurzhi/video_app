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
import 'package:video_app/domain/video/uploaded_video.dart';
import 'package:video_app/domain/video/video.dart';
import 'package:video_app/domain/video/video_event.dart';
import 'package:video_app/injectable.dart';

part 'video_list_cubit.freezed.dart';

part 'video_list_state.dart';

///VideoListCubit is needed to control the VideoListScreen view
@Injectable()
class VideoListCubit extends Cubit<VideoListState> {
  ///When VideoListScreen starts to display, VideoListCubit takes a loading state to inform the user that the Video List is about
  /// to be loaded
  VideoListCubit(this._repository, this._videoDataListReceiver, this._realtime) : super(VideoListState.loading());

  late RealtimeSubscription _subscription;
  late RealtimeSubscription _subscriptionOnUploadedVideo;
  final Realtime _realtime;
  final IVideoRepository _repository;
  final VideoDataListReceiver _videoDataListReceiver;

  ///method for subscription on video event file
  void subscriptionOnVideoEvent() {
    _subscription = _realtime.subscribe(<String>[
      'databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents',
      'buckets.633c5933bd7ce6a7f5cb.files'
    ]);
    _subscription.stream.listen(
      (RealtimeMessage response) {
        if (response.events
            .contains('databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.*.create')) {
          emit(
            state.copyWith(
              event: optionOf(const VideoEvent.newVideo()),
              videoListFailureOrSuccessOption: none(),
            ),
          );
        }

        if (response.events
            .contains('databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.*.update')) {
          emit(
            state.copyWith(
              event: optionOf(const VideoEvent.updated()),
              videoListFailureOrSuccessOption: none(),
            ),
          );
        }

        if (response.events
            .contains('databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.*.delete')) {
          emit(
            state.copyWith(
              event: optionOf(const VideoEvent.deleted()),
              videoListFailureOrSuccessOption: none(),
            ),
          );
        }
        _getVideoListFromTheServer();
      },
    );
  }

  ///method for subscription on video event file
  Future<void> subscriptionOnUploadedVideoEvent() async {
    final String appUserId = getIt<UserCubit>().userId;

    _subscriptionOnUploadedVideo = _realtime.subscribe(<String>[
      'databases.634b7fb186e7065ec5a2.collections.upload_$appUserId.documents',
    ]);
    _subscriptionOnUploadedVideo.stream.listen(
      (RealtimeMessage response) {
        getUploadedVideoListForUser(appUserId: appUserId);
      },
    );
  }

  ///Used when VideoListScreen starts to display
  Future<void> initialList() async {
    emit(VideoListState.loading());
    subscriptionOnVideoEvent();
    await _getVideoListFromTheServer();
  }

  ///Used when VideoListScreen starts to display
  Future<void> initialUploadList() async {
    emit(VideoListState.loading());
    print('\n\n\nobject');
    subscriptionOnUploadedVideoEvent();
    await getUploadedVideoListForUser();
  }

  Future<Either<Failure, VideoDataList>> _downloadVideoList() async {
    final Either<Failure, VideoDataList> videoListOrFailure = await _repository.getVideoList();
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

  Future<void> _getVideoListFromTheServer() async {
    final Either<Failure, VideoDataList> videoListOrFailure = await _downloadVideoList();
    if (!isClosed) {
      emit(VideoListState.listDisplayed());
    }
    if (!isClosed) {
      emit(
        state.copyWith(
          loading: false,
          event: none(),
          videoListFailureOrSuccessOption: optionOf(
            videoListOrFailure.replace(unit),
          ),
        ),
      );
    }
  }

  ///method to get uploaded video list
  Future<void> getUploadedVideoListForUser({String? appUserId}) async {
    final String appUserId = getIt<UserCubit>().userId;
    final Either<Failure, UploadedVideoDataList> resultOrFailure = await _repository.getUploadedVideoList(appUserId);
    resultOrFailure.fold(
      (Failure l) => null,
      (UploadedVideoDataList uploadedVideoDataList) {
        getIt<DataListReceiver<UploadedVideoDataList>>().getDataList(uploadedVideoDataList);
      },
    );

    emit(
      state.copyWith(
        loading: false,
        videoListFailureOrSuccessOption: optionOf(
          resultOrFailure.replace(unit),
        ),
      ),
    );
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
