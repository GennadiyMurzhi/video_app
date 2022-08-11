import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
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
  Future<Either<Failure, Unit>> uploadVideoOnServer(String path) async {
    try {
      await _videosStorage.createFile(
        bucketId: '62e3f62d96bf680e817c',
        fileId: 'unique()',
        file: InputFile(
          path: path,
          filename: p.basename(
            path,
          ),
        ),
      );
      return const Right(unit);
    } catch (e) {
      return const Left(Failure.serverError());
    }
  }
}
