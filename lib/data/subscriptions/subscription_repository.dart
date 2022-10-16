import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/data/core/check_document_mixin.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/subscriptions/i_subscription_reposytory.dart';
import 'package:video_app/domain/subscriptions/subscription.dart';

const String _subscriptionDatabaseId = '634674f3ed62be3f629a';

///repository for subscription manipulation
@Injectable(as: ISubscriptionRepository)
class SubscriptionRepository extends ISubscriptionRepository with CheckDocumentMixin {
  ///pass the client to create database
  SubscriptionRepository(Client client) {
    _subscriptionDatabase = Databases(client, databaseId: _subscriptionDatabaseId);
  }

  late final Databases _subscriptionDatabase;

  @override
  Future<Either<Failure, Subscriptions>> getAppUserSubscriptions(String appUserID) async {
    try {
      final DocumentList subscriptionsDocuments =
          await _subscriptionDatabase.listDocuments(collectionId: _userSubscriptionsCollectionId(appUserID));
      return right(Subscriptions.fromDocumentList(subscriptionsDocuments.documents));
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, bool>> isUserSubscribe({
    required String appUserID,
    required String subscribeUserId,
  }) async {
    final Either<Failure, bool> result = await checkDocumentById(
      targetDatabase: _subscriptionDatabase,
      targetCollectionId: _userSubscriptionsCollectionId(appUserID),
      targetDocumentId: subscribeUserId,
    );
    return result;
  }

  @override
  Future<Either<Failure, Unit>> subscribe({
    required String appUserID,
    required String subscribeUserId,
    required String subscribeUserName,
  }) async {
    try {
      await _subscriptionDatabase.createDocument(
        collectionId: _userSubscriptionsCollectionId(appUserID),
        documentId: subscribeUserId,
        data: <String, dynamic>{
          'user_name': subscribeUserName,
        },
      );
      return right(unit);
    } catch (e) {
      print(e);
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> unsubscribe({
    required String appUserID,
    required String subscribeUserId,
  }) async {
    try {
      await _subscriptionDatabase.deleteDocument(
        collectionId: _userSubscriptionsCollectionId(appUserID),
        documentId: subscribeUserId,
      );
      return right(unit);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }
}

String _userSubscriptionsCollectionId(String appUserID) => 'subscriptions_$appUserID';
