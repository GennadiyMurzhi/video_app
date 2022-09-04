import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/video/comments/comments.dart';
import 'package:video_app/domain/video/comments/comments_failure.dart';
import 'package:video_app/domain/video/comments/i_comments_repository.dart';

const String _commentsCollectionId = '630cdbc377f341426133';
const String _subCommentsCollectionId = '630cded483e663a5382c';

@Injectable(as: ICommentsRepository)
class CommentsRepository extends ICommentsRepository {
  CommentsRepository(this._client) {
    _database = Databases(
      _client,
      databaseId: '62e3faba8623b7647567',
    );
  }

  late final Databases _database;
  final Client _client;

  @override
  Future<Either<CommentsFailure, SubComments>> getSubComments(String commentId) async {
    try {
      final DocumentList documentList = await _database.listDocuments(
        collectionId: _subCommentsCollectionId,
        queries: <dynamic>[
          Query.equal('comment_id', commentId),
        ],
      );
      return Right(SubComments.fromDocumentList(documentList.documents));
    } catch (e) {
      return const Left(CommentsFailure.serverError());
    }
  }

  @override
  Future<Either<CommentsFailure, Comments>> getVideoComments(String videoId) async {
    try {
      final DocumentList documentList = await _database.listDocuments(
        collectionId: _commentsCollectionId,
        queries: <dynamic>[
          Query.equal('video_id', videoId),
        ],
      );
      return Right(Comments.fromDocumentList(documentList.documents));
    } catch (e) {
      return const Left(CommentsFailure.serverError());
    }
  }

  @override
  Future<Either<CommentsFailure, Unit>> uploadComment({
    required String userId,
    required String userName,
    required String videoId,
    required String comment,
  }) async {
    try {
      await _database.createDocument(
        collectionId: _commentsCollectionId,
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
      return Right(unit);
    } catch (e) {
      return const Left(CommentsFailure.serverError());
    }
  }

  @override
  Future<Either<CommentsFailure, Unit>> uploadSubComment({
    required String userId,
    required String userName,
    required String commentId,
    required String subComment,
  }) async {
    try {
      await _database.createDocument(
        collectionId: _subCommentsCollectionId,
        documentId: 'unique()',
        data: <dynamic, dynamic>{
          'user_id': userId,
          'user_name': userName,
          'comment_id': commentId,
          'sub_comment': subComment,
          'date': DateTime.now().millisecondsSinceEpoch,
        },
        read: ['role:all'],
      );
      return Right(unit);
    } catch (e) {
      return const Left(CommentsFailure.serverError());
    }
  }

  @override
  Future<Either<CommentsFailure, Unit>> updateMainComment({
    required String commentId,
    required String comment,
  }) async {
    final Either<CommentsFailure, Unit> result = await _updateComment(_commentsCollectionId, commentId, comment, 'comment');
    return result;
  }

  @override
  Future<Either<CommentsFailure, Unit>> updateSubComment({
    required String subCommentId,
    required String subComment,
  }) async {
    final Either<CommentsFailure, Unit> result = await _updateComment(_subCommentsCollectionId, subCommentId, subComment, 'sub_comment');
    return result;
  }

  Future<Either<CommentsFailure, Unit>> _updateComment(String collectionId, String commentId, String comment, String attribute) async {
    try {
      await _database.updateDocument(
        collectionId: collectionId,
        documentId: commentId,
        data: <dynamic, dynamic>{
          attribute: comment,
        },
      );
      return Right(unit);
    } catch (e) {
      return const Left(CommentsFailure.serverError());
    }
  }
}
