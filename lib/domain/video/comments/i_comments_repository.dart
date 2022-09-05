import 'package:dartz/dartz.dart';
import 'package:video_app/domain/video/comments/comments.dart';
import 'package:video_app/domain/video/comments/comments_failure.dart';

///contract to create an comments repository
abstract class ICommentsRepository {
  ///method for upload comment on the server
  Future<Either<CommentsFailure, Unit>> uploadComment({
    required String userId,
    required String userName,
    required String videoId,
    required String comment,
  });

  ///method for upload sub comment on the server
  Future<Either<CommentsFailure, Unit>> uploadSubComment({
    required String userId,
    required String userName,
    required String commentId,
    required String subComment,
  });

  ///update comment on the server
  Future<Either<CommentsFailure, Unit>> updateMainComment({
    required String commentId,
    required String comment,
  });

  ///update sub comment on the server
  Future<Either<CommentsFailure, Unit>> updateSubComment({
    required String subCommentId,
    required String subComment,
  });

  ///method for get video comments
  Future<Either<CommentsFailure, Comments>> getVideoComments(String videoId);

  ///method for get video sub comments
  Future<Either<CommentsFailure, SubComments>> getSubComments(String commentId);
}
