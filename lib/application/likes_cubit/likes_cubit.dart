import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/likes/i_like_repository.dart';
import 'package:video_app/domain/likes/like.dart';
import 'package:video_app/domain/video/i_video_repository.dart';
import 'package:video_app/injectable.dart';

part 'likes_cubit.freezed.dart';
part 'likes_state.dart';

@Injectable()
class LikesCubit extends Cubit<LikesState> {
  LikesCubit(this._likeRepository, this._videoRepository, this._realtime) : super(LikesState.init());
  final ILikeRepository _likeRepository;
  final IVideoRepository _videoRepository;
  final Realtime _realtime;

  Future<void> init() async {
    await _updateLikes();
    _subscriptionOnVideoEvent();
  }

  void _subscriptionOnVideoEvent() {
    final RealtimeSubscription subscription = _realtime.subscribe(<String>[
      'databases.633db14289b33423a068.collections.631b4f2663f40f701b38.documents',
    ]);
    subscription.stream.listen(
      (RealtimeMessage response) {
        if (response.events.contains('databases.633db14289b33423a068.collections.631b4f2663f40f701b38.documents')) {
          _updateLikes();
        }
      },
    );
  }

  Future<void> _updateLikes() async {
    final String userAppId = getIt<UserCubit>().userId;
    final Either<Failure, Likes> resultOrFailure = await _likeRepository.getListLikesForAppUser(userAppId);
    resultOrFailure.fold(
      (Failure l) => emit(state.copyWith(loading: false)),
      (Likes r) {
        emit(
          state.copyWith(
            loading: false,
          ),
        );
        getIt<DataListReceiver<Likes>>().getDataList(r);
      },
    );
  }

  Future<Uint8List> getVideoPreview(String videoId) async {
    final Either<Failure, Uint8List> resultOrFailure = await _videoRepository.getVideoPreviewFromTheServer(videoId);
    late final Uint8List imageUint8List;
    resultOrFailure.fold(
      (Failure l) {
        emit(
          state.copyWith(
            likesFailureOrSuccessOption: optionOf(resultOrFailure.replace(unit)),
          ),
        );
        imageUint8List = Uint8List.fromList(<int>[]);
      },
      (Uint8List r) {
        imageUint8List = r;
      },
    );

    return imageUint8List;
  }
}
