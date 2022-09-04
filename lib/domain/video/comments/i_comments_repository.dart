import 'package:dartz/dartz.dart';
import 'package:video_app/domain/video/comments/comments.dart';
import 'package:video_app/domain/video/comments/comments_failure.dart';

abstract class ICommentsRepository {
  Future<Either<CommentsFailure, Unit>> uploadComment({
    required String userId,
    required String userName,
    required String videoId,
    required String comment,
  });

  Future<Either<CommentsFailure, Unit>> uploadSubComment({
    required String userId,
    required String userName,
    required String commentId,
    required String subComment,
  });

  Future<Either<CommentsFailure, Unit>> updateMainComment({
    required String commentId,
    required String comment,
  });

  Future<Either<CommentsFailure, Unit>> updateSubComment({
    required String subCommentId,
    required String subComment,
  });

  Future<Either<CommentsFailure, Comments>> getVideoComments(String videoId);

  Future<Either<CommentsFailure, SubComments>> getSubComments(String commentId);
}
