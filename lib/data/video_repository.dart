import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/failures.dart';
import 'package:video_app/domain/i_video_repository.dart';
import 'package:video_app/domain/video.dart';

///Repository for video
@Injectable(as: IVideoRepository)
class VideoRepository implements IVideoRepository {
  ///Repository constructor receives the videos [storage] to manipulate files on the servers
  const VideoRepository(this._videosStorage);

  final Storage _videosStorage;

  @override
  Future<Either<Failure, VideoDataList>> getVideoList() async {
    final FileList fileList;
    try {
      fileList = await _videosStorage.listFiles(bucketId: '62e3f62d96bf680e817c');
      return Right(
        VideoDataList.fromJson(<String, dynamic>{
          'total': fileList.total,
          'files': List<Map<String, dynamic>>.generate(fileList.files.length, (int index) => fileList.files[index].toMap()),
        }),
      );
    } catch (e) {
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> uploadVideoOnServer(FilePickerResult filePickerResult) async {
    /*final InputFile inputFile;
    if(kIsWeb) {
      inputFile = InputFile(
        bytes: filePickerResult.files.first.bytes,
        filename: filePickerResult.files.first.name,
      );
    } else {
      inputFile = InputFile(
        path: filePickerResult.files.first.path,
        filename: filePickerResult.files.first.name,
      );
    }*/

    try {
      await _videosStorage.createFile(
        bucketId: '62e3f62d96bf680e817c',
        fileId: 'unique()',
        file: InputFile(
          filename: filePickerResult.files.first.name,
          bytes: filePickerResult.files.first.bytes,
        ),
      );

      return const Right(unit);
    } catch (e) {
      print(e);
      return const Left(Failure.serverError());
    }
  }
}
