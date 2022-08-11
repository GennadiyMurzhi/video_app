import 'package:dartz/dartz.dart';
import 'package:video_app/domain/failures.dart';
import 'package:video_app/domain/video.dart';

///Interface for the video repository
abstract class IVideoRepository {
  ///A method to get a list of all videos
  Future<Either<Failure, VideoDataList>> getVideoList();
  ///A method to upload video on server
  Future<Either<Failure, Unit>> uploadVideoOnServer(String path);
}
