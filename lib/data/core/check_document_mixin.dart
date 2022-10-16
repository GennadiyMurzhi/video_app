import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:video_app/domain/core/failures.dart';

///mixin which contains the logic for checking if a document is in the collection
class CheckDocumentMixin {
  ///method to check document in collection by attribute
  Future<Either<Failure, bool>> checkDocumentByAttribute({
    required Databases targetDatabase,
    required String targetCollectionId,
    required String targetAttribute,
    required dynamic targetAttributeValue,
  }) async {
    try {
      final DocumentList documentList = await targetDatabase.listDocuments(
        collectionId: targetCollectionId,
        queries: <dynamic>[
          Query.equal(targetAttribute, targetAttributeValue),
        ],
      );
      if (documentList.total != 0) {
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  ///method to check document in collection by attribute
  Future<Either<Failure, bool>> checkDocumentById({
    required Databases targetDatabase,
    required String targetCollectionId,
    required String targetDocumentId,
  }) async {
    try {
      await targetDatabase.getDocument(
        collectionId: targetCollectionId,
        documentId: targetDocumentId,
      );

      return right(true);
    } on AppwriteException catch (e) {
      if (e.code == 404) {
        return right(false);
      }
      return left(const Failure.serverError());
    }
  }
}
