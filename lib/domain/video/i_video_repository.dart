import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_app/domain/video/failures.dart';
import 'package:video_app/domain/video/video.dart';

///Interface for the video repository
abstract class IVideoRepository {
  ///A method to get a list of all videos
  Future<Either<Failure, VideoDataList>> getVideoList();

  ///A method for get video from the server
  Future<Either<Failure, Uint8List>> getVideoFromTheServer(String fileId);

  ///A method to upload video on server
  Future<Either<Failure, Unit>> uploadVideoOnServer(FilePickerResult filePickerResult);

  ///A method to replace video on server
  Future<Either<Failure, Unit>> replaceVideoOnServer({
    required FilePickerResult filePickerResult,
    required String fileName,
    required String fileId,
  });

  ///A method to delete video on server
  Future<Either<Failure, Unit>> deleteVideoOnServer(String fileId);
}
