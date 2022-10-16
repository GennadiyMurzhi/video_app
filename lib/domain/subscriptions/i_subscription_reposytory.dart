import 'package:dartz/dartz.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/subscriptions/subscription.dart';

///contract for subscription repository
abstract class ISubscriptionRepository {
  ///user subscription verification
  Future<Either<Failure, bool>> isUserSubscribe({required String appUserID, required String subscribeUserId});

  ///subscribe on user
  Future<Either<Failure, Unit>> unsubscribe({
    required String appUserID,
    required String subscribeUserId,
  });

  ///subscribe on user
  Future<Either<Failure, Unit>> subscribe({
    required String appUserID,
    required String subscribeUserId,
    required String subscribeUserName,
  });

  ///method for getting all the app user subscriptions
  Future<Either<Failure, Subscriptions>> getAppUserSubscriptions(String appUserID);
}
