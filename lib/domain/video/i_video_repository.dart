import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/video/success.dart';
import 'package:video_app/domain/video/uploaded_video.dart';
import 'package:video_app/domain/video/video.dart';

///Interface for the video repository
abstract class IVideoRepository {
  ///A method to get a list of all videos
  Future<Either<Failure, VideoDataList>> getVideoList();

  ///A method to get a list of uploaded videos of a particular user
  Future<Either<Failure, UploadedVideoDataList>> getUploadedVideoList(String userId);

  ///A method to get a video data
  Future<Either<Failure, VideoData>> getDataForVideo(String videoDataDocumentId);

  ///A method for get video from the server
  Future<Either<Failure, Uint8List>> getVideoFromTheServer(String fileId);

  ///A method for get video from the server
  Future<Either<Failure, Uint8List>> getVideoPreviewFromTheServer(String fileId);

  ///A method to upload video on server
  Future<Either<Failure, Success>> uploadVideoOnServer({
    required FilePickerResult filePickerResult,
    required String previewPath,
    required String userId,
    required String name,
    required String description,
  });

  ///A method to replace video on server
  Future<Either<Failure, Success>> replaceVideoOnServer({
    required String userId,
    required FilePickerResult filePickerResult,
    required String previewPath,
    required String fileName,
    required String fileId,
  });

  ///A method to delete video on server
  Future<Either<Failure, Success>> deleteVideoOnServer(String fileId);

  ///A method to update video information
  Future<Either<Failure, Success>> updateVideoInformation({
    required String videoId,
    String? name,
    String? description,
  });
}
