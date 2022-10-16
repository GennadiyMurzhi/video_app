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
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/likes/i_like_repository.dart';
import 'package:video_app/domain/photo/i_photo_repository.dart';
import 'package:video_app/domain/subscriptions/i_subscription_reposytory.dart';
import 'package:video_app/domain/video/i_video_repository.dart';
import 'package:video_app/domain/video/success.dart';
import 'package:video_app/domain/video/video.dart';
import 'package:video_app/injectable.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'video_cubit.freezed.dart';

part 'video_state.dart';

///cubit for manipulation on video_screen
@Injectable()
class VideoCubit extends Cubit<VideoState> {
  ///Storage need to update and delete video on the server
  VideoCubit(this._videoRepository, this._photoRepository, this._likeRepository, this._subscriptionRepository)
      : super(VideoState.initial());

  final IVideoRepository _videoRepository;
  final IPhotoRepository _photoRepository;
  final ILikeRepository _likeRepository;
  final ISubscriptionRepository _subscriptionRepository;

  RealtimeSubscription? _realtimeSubscription;

  ///need to init video on create screen
  Future<void> init(String videoFileId) async {
    final Either<Failure, VideoData> videoData = await _videoRepository.getDataForVideo('video_data_$videoFileId');
    videoData.fold(
      (Failure l) => emit(
        state.copyWith(
          //videoStatus: VideoStatus.display,
          videoFailureOrSuccessOption: optionOf(
            videoData.replace(const Success.none()),
          ),
        ),
      ),
      (VideoData videoData) => emit(
        state.copyWith(
          userName: videoData.userName,
          videoFileId: videoFileId,
          videoName: videoData.name,
          userId: videoData.userId,
          videoDescription: videoData.description,
        ),
      ),
    );

    await _isUserLiked();

    await _updateLikesCount();

    await _isUserSubscribed();

    _realtimeSubscriptionOnUpdateVideoInformation();

    if (kIsWeb) {
      final VideoPlayerController videoPlayerController = VideoPlayerController.network(_linkVideo(state.videoFileId));
      emit(
        state.copyWith(
          videoStatus: VideoStatus.loading,
          chewieController: ChewieController(
            videoPlayerController: videoPlayerController,
          )..videoPlayerController.initialize(),
        ),
      );

      await _getUserPhoto();

      emit(
        state.copyWith(videoStatus: VideoStatus.display),
      );
    } else {
      emit(
        state.copyWith(
          videoStatus: VideoStatus.loading,
        ),
      );
      await _getUserPhoto();
      final Either<Failure, Uint8List> fileBytesOrFailure =
          await _videoRepository.getVideoFromTheServer(state.videoFileId);
      Directory? directory;
      File videoFile;
      if (fileBytesOrFailure.isRight()) {
        directory = await getApplicationDocumentsDirectory();
      }

      fileBytesOrFailure.fold(
        (Failure l) => null, //_serverErrorShowMessage(),
        (Uint8List r) {
          videoFile = File('${directory!.path}/${state.videoName}.mp4');
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

    _crutchLinkVideo = _linkVideo(state.videoFileId);
  }

  ///method to update comments for video
  void _realtimeSubscriptionOnUpdateVideoInformation() {
    final String appUserId = getIt<UserCubit>().userId;
    final String videoDataDocumentId = 'video_data_${state.videoFileId}';
    final String videoLikesDocumentId = 'likes_${state.videoFileId}';
    final String userPhotoId = 'photo_${state.userId}';
    final String userAppIdSubscriptionsCollectionId = 'subscriptions_$appUserId';

    _realtimeSubscription = getIt<Realtime>().subscribe(<String>[
      'databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.$videoDataDocumentId',
      'buckets.6331920b37c4ada48ccd.files.$userPhotoId',
      'databases.62e3faba8623b7647567.collections.6342d4582b51c9e0d48c.documents.$videoLikesDocumentId',
      'databases.634674f3ed62be3f629a.collections.$userAppIdSubscriptionsCollectionId.documents.${state.userId}',
    ]);
    _realtimeSubscription!.stream.listen(
      (RealtimeMessage response) async {
        if (response.events.contains(
            'databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.$videoDataDocumentId.update')) {
          _updateVideoInfo();
        }
        if (response.events.contains('buckets.6331920b37c4ada48ccd.files.photo_${state.userId}.create')) {
          _getUserPhoto();
        }
        if (response.events.contains(
            'databases.62e3faba8623b7647567.collections.6342d4582b51c9e0d48c.documents.$videoLikesDocumentId.update')) {
          _isUserLiked();
          _updateLikesCount();
        }

        if (response.events.contains(
                'databases.634674f3ed62be3f629a.collections.$userAppIdSubscriptionsCollectionId.documents.${state.userId}.create') ||
            response.events.contains(
                'databases.634674f3ed62be3f629a.collections.$userAppIdSubscriptionsCollectionId.documents.${state.userId}.delete')) {
          print('_isUserSubscribed');
          print('databases.634674f3ed62be3f629a.collections.$userAppIdSubscriptionsCollectionId.documents.${state.userId}.delete');
          _isUserSubscribed();
        }
      },
    );
  }

  Future<void> _updateVideoInfo() async {
    final Either<Failure, VideoData> documentOrFailure =
        await _videoRepository.getDataForVideo('video_data_${state.videoFileId}');
    final Either<Failure, Success> editEiter = documentOrFailure.replace(const Success.videoInfoUpdated());
    documentOrFailure.fold(
      (Failure l) => emit(
        state.copyWith(
          videoFailureOrSuccessOption: optionOf(editEiter),
        ),
      ),
      (VideoData videoData) {
        emit(
          state.copyWith(
            videoName: videoData.name,
            videoDescription: videoData.description,
          ),
        );
      },
    );
  }

  Future<void> _getUserPhoto() async {
    final Option<Uint8List> userPhoto = await _photoRepository.getUserPhoto(state.userId);
    userPhoto.fold(
      () => null,
      (Uint8List userPhotoBits) => emit(
        state.copyWith(
          userPhotoBits: userPhotoBits,
        ),
      ),
    );
  }

  ///needed to return the state when return to the video_list_screen
  void displayVideo() {
    emit(
      state.copyWith(
        videoStatus: VideoStatus.display,
      ),
    );
  }

  ///method to update video on the server
  Future<Either<Failure, Success>> updateVideo() async {
    final FilePickerResult? filePickerResult = await pickFile();

    if (filePickerResult != null) {
      emit(
        state.copyWith(
          videoStatus: VideoStatus.replacing,
          videoFailureOrSuccessOption: none(),
        ),
      );

      final String? thumb = await VideoThumbnail.thumbnailFile(
        video: filePickerResult.paths[0]!,
        thumbnailPath: (await getTemporaryDirectory()).path,
        quality: 100,
      );

      final Either<Failure, Success> resultOrFailure = await _videoRepository.replaceVideoOnServer(
        userId: state.userId,
        previewPath: thumb!,
        fileId: state.videoFileId,
        fileName: state.videoFileId,
        filePickerResult: filePickerResult,
      );
      resultOrFailure.fold(
        (Failure failure) => failure.maybeWhen(
          serverError: () => emit(
            state.copyWith(
              videoStatus: VideoStatus.display,
            ),
          ),
          orElse: () => null,
        ),
        (Success r) => null,
      );

      emit(
        state.copyWith(
          videoFailureOrSuccessOption: optionOf(resultOrFailure),
        ),
      );

      if (!kIsWeb && resultOrFailure.isRight()) {
        File? videoFile;
        final Either<Failure, Uint8List> fileBytesOrFailure =
            await _videoRepository.getVideoFromTheServer(state.videoFileId);
        if (fileBytesOrFailure.isRight()) {
          Directory directory = await getApplicationDocumentsDirectory();
          videoFile = File('${directory.path}/${state.videoFileId}.mp4');
        }
        fileBytesOrFailure.fold(
          (Failure l) => emit(
            state.copyWith(
              videoStatus: VideoStatus.display,
              videoFailureOrSuccessOption: optionOf(fileBytesOrFailure.replace(const Success.videoInfoUpdated())),
            ),
          ),
          (Uint8List r) {
            videoFile!.writeAsBytesSync(r as List<int>);

            final VideoPlayerController videoPlayerController = VideoPlayerController.file(videoFile);

            emit(
              state.copyWith(
                videoStatus: VideoStatus.display,
                chewieController: ChewieController(videoPlayerController: videoPlayerController)
                  ..videoPlayerController.initialize(),
                videoFailureOrSuccessOption: none(),
              ),
            );
          },
        );
      }

      if (kIsWeb && resultOrFailure.isRight()) {
        _crutchLinkVideo = '$_crutchLinkVideo/';
        final VideoPlayerController videoPlayerController = VideoPlayerController.network(_crutchLinkVideo)
          ..initialize();
        emit(
          state.copyWith(
            videoStatus: VideoStatus.display,
            chewieController: ChewieController(videoPlayerController: videoPlayerController),
            videoFailureOrSuccessOption: none(),
          ),
        );
      }

      return resultOrFailure;
    }
    return left(const Failure.fileNotChoose());
  }

  ///method to delete video on the server
  Future<Either<Failure, Success>> deleteVideo() async {
    emit(
      state.copyWith(
        videoStatus: VideoStatus.deleting,
        videoFailureOrSuccessOption: none(),
      ),
    );

    final Either<Failure, Success> resultOrFailure = await _videoRepository.deleteVideoOnServer(state.videoFileId);
    resultOrFailure.fold(
      (Failure failure) => failure.maybeWhen(
        serverError: () => emit(
          state.copyWith(
            videoStatus: VideoStatus.display,
            videoFailureOrSuccessOption: optionOf(resultOrFailure),
          ),
        ),
        orElse: () => null,
      ),
      (Success r) {
        emit(
          state.copyWith(
            videoStatus: VideoStatus.deleted,
            videoFailureOrSuccessOption: optionOf(resultOrFailure),
          ),
        );
      },
    );

    return resultOrFailure;
  }

  ///method to like video
  Future<void> likeVideo({required bool isLike}) async {
    final Either<Failure, Unit> resultOrFailure = await _likeRepository.likeVideo(
      isLike: isLike,
      videoId: state.videoFileId,
    );
    if (resultOrFailure.isLeft()) {
      emit(
        state.copyWith(
          videoFailureOrSuccessOption: optionOf(
            resultOrFailure.replace(
              const Success.videoInfoUpdated(),
            ),
          ),
        ),
      );
    }
  }

  ///method to check video like
  Future<void> _isUserLiked() async {
    final String userId = getIt<UserCubit>().state.id;
    final Either<Failure, bool> likeOrFailure = await _likeRepository.isUserLiked(userId, state.videoFileId);
    likeOrFailure.fold(
      (Failure l) => emit(
        state.copyWith(
          videoFailureOrSuccessOption: optionOf(
            likeOrFailure.replace(
              const Success.none(),
            ),
          ),
        ),
      ),
      (bool r) => emit(
        state.copyWith(isUserLiked: r),
      ),
    );

    final Either<Failure, bool> dislikeOrFailure = await _likeRepository.isUserDisliked(userId, state.videoFileId);
    dislikeOrFailure.fold(
      (Failure l) => emit(
        state.copyWith(
          videoFailureOrSuccessOption: optionOf(
            dislikeOrFailure.replace(
              const Success.none(),
            ),
          ),
        ),
      ),
      (bool r) => emit(
        state.copyWith(isUserDisliked: r),
      ),
    );
  }

  Future<void> _updateLikesCount() async {
    final Either<Failure, Map<String, int>> resultOrFailure = await _likeRepository.getLikesDislikesCount(state.videoFileId);
    resultOrFailure.fold(
      (Failure l) => emit(
        state.copyWith(
          videoFailureOrSuccessOption: optionOf(
            resultOrFailure.replace(
              const Success.none(),
            ),
          ),
        ),
      ),
      (Map<String, int> r) => emit(
        state.copyWith(
          likesCount: r['likes_count']!,
          dislikesCount: r['dislikes_count']!,
        ),
      ),
    );
  }

  ///method to subscribe on user which upload video
  Future<void> subscribeOnUser() async {
    final String appUserId = getIt<UserCubit>().userId;
    await _baseFailureUnitMethod(
      () => _subscriptionRepository.subscribe(
        appUserID: appUserId,
        subscribeUserId: state.userId,
        subscribeUserName: state.userName,
      ),
    );
  }

  ///method to unsubscribe on user which upload video
  Future<void> unsubscribeOnUser() async {
    final String appUserId = getIt<UserCubit>().userId;
    await _baseFailureUnitMethod(
      () => _subscriptionRepository.unsubscribe(
        appUserID: appUserId,
        subscribeUserId: state.userId,
      ),
    );
  }

  Future<void> _isUserSubscribed() async {
    final String appUserId = getIt<UserCubit>().userId;
    final Either<Failure, bool> resultOrFailure = await _subscriptionRepository.isUserSubscribe(
      appUserID: appUserId,
      subscribeUserId: state.userId,
    );
    resultOrFailure.fold(
      (Failure l) => null,
      (bool isAppUserSubscribed) => emit(
        state.copyWith(
          isAppUserSubscribe: isAppUserSubscribed,
        ),
      ),
    );

    emit(
      state.copyWith(
        videoFailureOrSuccessOption: optionOf(resultOrFailure.replace(const Success.none())),
      ),
    );
  }

  Future<void> _baseFailureUnitMethod(Future<Either<Failure, Unit>> Function() function) async {
    final Either<Failure, Unit> resultOrFailure = await function();
    resultOrFailure.fold(
      (Failure l) => null,
      (Unit r) => null,
    );
    emit(
      state.copyWith(
        videoFailureOrSuccessOption: optionOf(resultOrFailure.replace(const Success.none())),
      ),
    );
  }
}

//void _serverErrorShowMessage() => showSnackWithText('Server Error');

String _crutchLinkVideo = '';

String _linkVideo(String id) =>
    'http://localhost/v1/storage/buckets/62e3f62d96bf680e817c/files/$id/view?project=62e3e3500061cd4fb81d&mode=admin';
