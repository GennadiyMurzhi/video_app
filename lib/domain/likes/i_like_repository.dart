import 'package:dartz/dartz.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/likes/like.dart';

///contract for like repository
abstract class ILikeRepository {
  ///method to see if the user has liked the video
  Future<Either<Failure, bool>> isUserLiked(String userId, String videoId);

  ///method to see if the user has disliked the video
  Future<Either<Failure, bool>> isUserDisliked(String userId, String videoId);

  ///method to see if the user has disliked the video
  Future<Either<Failure, Map<String, int>>> getLikesDislikesCount(String videoId);

  ///like the video
  Future<Either<Failure, Unit>> likeVideo({required bool isLike, required String videoId});

  ///method for getting all the user's likes
  Future<Either<Failure, Likes>> getListLikesForAppUser(String userAppID);
}
