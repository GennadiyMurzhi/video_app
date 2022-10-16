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
import 'package:video_app/domain/photo/i_photo_repository.dart';
import 'package:video_app/domain/subscriptions/i_subscription_reposytory.dart';
import 'package:video_app/domain/subscriptions/subscription.dart';
import 'package:video_app/domain/video/i_video_repository.dart';
import 'package:video_app/injectable.dart';

part 'subscriptions_cubit.freezed.dart';

part 'subscriptions_state.dart';

@Injectable()
class SubscriptionsCubit extends Cubit<SubscriptionsState> {
  SubscriptionsCubit(this._subscriptionRepository, this._photoRepository, this._realtime)
      : super(SubscriptionsState.init());
  final ISubscriptionRepository _subscriptionRepository;
  final IPhotoRepository _photoRepository;
  final Realtime _realtime;

  Future<void> init() async {
    await _updateSubscriptions();
    _subscriptionOnSubscriptionEvent();
    emit(
      state.copyWith(
        loading: false,
      ),
    );
  }

  void _subscriptionOnSubscriptionEvent() {
    final String appUserId = getIt<UserCubit>().userId;
    final String appUserIdSubscriptionsCollectionId = 'subscriptions_$appUserId';

    final RealtimeSubscription subscription = _realtime.subscribe(<String>[
      'databases.634674f3ed62be3f629a.collections.$appUserIdSubscriptionsCollectionId.documents',
    ]);
    subscription.stream.listen(
      (RealtimeMessage response) {
        if (response.events.contains(
                'databases.634674f3ed62be3f629a.collections.$appUserIdSubscriptionsCollectionId.documents.*.create') ||
            response.events.contains(
                'databases.634674f3ed62be3f629a.collections.$appUserIdSubscriptionsCollectionId.documents.*.delete')) {
          _updateSubscriptions();
        }
      },
    );
  }

  Future<void> _updateSubscriptions() async {
    final String userAppId = getIt<UserCubit>().userId;
    final Either<Failure, Subscriptions> resultOrFailure =
        await _subscriptionRepository.getAppUserSubscriptions(userAppId);
    resultOrFailure.fold(
      (Failure l) => null,
      (Subscriptions subscriptions) => getIt<DataListReceiver<Subscriptions>>().getDataList(subscriptions),
    );
  }

  Future<Uint8List> getUserPhotoPreview(String userId) async {
    final Option<Uint8List> resultOrFailure = await _photoRepository.getUserPhoto(userId);
    late final Uint8List imageUint8List;

    resultOrFailure.fold(
      () => imageUint8List = Uint8List.fromList(<int>[]),
      (Uint8List r) {
        imageUint8List = r;
      },
    );

    return imageUint8List;
  }

  Future<void> unsibscrebe(String userId) async {
    final String appUserId = getIt<UserCubit>().userId;
    final Either<Failure, Unit> resultOrFailure =
        await _subscriptionRepository.unsubscribe(appUserID: appUserId, subscribeUserId: userId);
    emit(
      state.copyWith(
        subscriptionFailureOrSuccessOption: optionOf(resultOrFailure),
      ),
    );
  }
}
