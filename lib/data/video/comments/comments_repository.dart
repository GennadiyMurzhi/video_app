import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/video/comments/comments.dart';
import 'package:video_app/domain/video/comments/comments_failure.dart';
import 'package:video_app/domain/video/comments/i_comments_repository.dart';

///repository for manipulation comments on the server
@Injectable(as: ICommentsRepository)
class CommentsRepository extends ICommentsRepository {
  ///pass the appwrite client to create appwrite database object for manipulating comments database
  CommentsRepository(this._client) {
    _commentsDatabase = Databases(
      _client,
      databaseId: '631960756fdf55a5c9c3',
    );
    _subCommentsDatabase = Databases(
      _client,
      databaseId: '631960da68ba468f7fe9',
    );
  }

  late final Databases _commentsDatabase;
  late final Databases _subCommentsDatabase;
  final Client _client;

  @override
  Future<Either<CommentsFailure, SubComments>> getSubComments(String subCommentsCollectionId) async {
    try {
      final DocumentList documentList = await _subCommentsDatabase.listDocuments(
        collectionId: subCommentsCollectionId,
      );
      return right(SubComments.fromDocumentList(documentList.documents));
    } catch (e) {
      return left(const CommentsFailure.serverError());
    }
  }

  @override
  Future<Either<CommentsFailure, Comments>> getVideoComments(String commentsCollectionId) async {
    print(commentsCollectionId);
    try {
      final DocumentList documentList = await _commentsDatabase.listDocuments(
        collectionId: commentsCollectionId,
      );
      return right(Comments.fromDocumentList(documentList.documents));
    } catch (e) {
      print(e);
      return left(const CommentsFailure.serverError());
    }
  }

  @override
  Future<Either<CommentsFailure, Unit>> uploadComment({
    required String commentsCollectionId,
    required String userId,
    required String userName,
    required String videoId,
    required String comment,
  }) async {
    try {
      await _commentsDatabase.createDocument(
        collectionId: commentsCollectionId,
        documentId: 'unique()',
        data: <dynamic, dynamic>{
          'user_id': userId,
          'user_name': userName,
          'video_id': videoId,
          'comment': comment,
          'date': DateTime.now().millisecondsSinceEpoch,
        },
        read: ['role:all'],
      );
      return right(unit);
    } catch (e) {
      print(e);
      return left(const CommentsFailure.serverError());
    }
  }

  @override
  Future<Either<CommentsFailure, Unit>> uploadSubComment({
    required String subCommentsCollectionId,
    required String userId,
    required String userName,
    required String subComment,
  }) async {
    try {
      await _subCommentsDatabase.createDocument(
        collectionId: subCommentsCollectionId,
        documentId: 'unique()',
        data: <dynamic, dynamic>{
          'user_id': userId,
          'user_name': userName,
          'sub_comment': subComment,
          'date': DateTime.now().millisecondsSinceEpoch,
        },
        read: ['role:all'],
      );
      return right(unit);
    } catch (e) {
      print(e);
      return left(const CommentsFailure.serverError());
    }
  }

  @override
  Future<Either<CommentsFailure, Unit>> updateComment({
    required String commentsCollectionId,
    required String commentId,
    required String comment,
  }) async {
    final Either<CommentsFailure, Unit> result =
        await _updateComment(_commentsDatabase, commentsCollectionId, commentId, comment, 'comment');
    return result;
  }

  @override
  Future<Either<CommentsFailure, Unit>> updateSubComment({
    required String subCommentsCollectionId,
    required String subCommentId,
    required String subComment,
  }) async {
    final Either<CommentsFailure, Unit> result =
        await _updateComment(_subCommentsDatabase, subCommentsCollectionId, subCommentId, subComment, 'sub_comment');
    return result;
  }

  Future<Either<CommentsFailure, Unit>> _updateComment(
    Databases databases,
    String collectionId,
    String commentId,
    String comment,
    String attribute,
  ) async {
    try {
      await databases.updateDocument(
        collectionId: collectionId,
        documentId: commentId,
        data: <dynamic, dynamic>{
          attribute: comment,
        },
      );
      return right(unit);
    } catch (e) {
      print(e);
      return left(const CommentsFailure.serverError());
    }
  }
}
