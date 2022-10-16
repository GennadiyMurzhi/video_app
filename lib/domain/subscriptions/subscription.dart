import 'package:appwrite/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.freezed.dart';

///subscriptions list
@freezed
class Subscriptions with _$Subscriptions {
  ///factory constructor for generate Subscription model
  const factory Subscriptions({
    required int total,
    required List<Subscription> subscriptions,
  }) = _Subscriptions;

  ///Empty Subscriptions
  factory Subscriptions.empty () => const Subscriptions(total: 0, subscriptions: <Subscription>[]);

  ///method to make Subscriptions from documents
  factory Subscriptions.fromDocumentList(List<Document> documentList) => Subscriptions(
    total: documentList.length,
    subscriptions: List<Subscription>.generate(
      documentList.length,
          (int index) => Subscription.fromDocument(documentList[index]),
    ),
  );
}

///class to represent data subscription from the server
@freezed
class Subscription with _$Subscription {
  ///factory constructor for generate Subscription model
  const factory Subscription({
    required String subscriptionUserId,
    required String subscriptionUserName,
  }) = _Subscription;

  ///method to make Subscription from document
  factory Subscription.fromDocument(Document document) => Subscription(
        subscriptionUserId: document.$id,
        subscriptionUserName: document.data['user_name'] as String,
      );
}
