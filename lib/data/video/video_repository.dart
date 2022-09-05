import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/video/failures.dart';
import 'package:video_app/domain/video/i_video_repository.dart';
import 'package:video_app/domain/video/video.dart';

const String _bucketId = '62e3f62d96bf680e817c';

///Repository for video
@Injectable(as: IVideoRepository)
class VideoRepository implements IVideoRepository {
  ///Repository constructor receives the videos [storage] to manipulate files on the servers
  VideoRepository(this._videosStorage, this._client) {
    _database = Databases(
      _client,
      databaseId: '62e3faba8623b7647567',
    );
  }

  late final Databases _database;
  final Client _client;
  final Storage _videosStorage;

  @override
  Future<Either<Failure, VideoDataList>> getVideoList() async {
    try {
      final DocumentList documentList = await _database.listDocuments(
        collectionId: '63149b1a760e860f01a9',
        orderAttributes: ['\$createdAt'],
        orderTypes: ['DESC'],
      );
      return right(VideoDataList.fromDocumentList(documentList.documents));
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Uint8List>> getVideoFromTheServer(String fileId) async {
    try {
      final Uint8List fileBytes = await _videosStorage.getFileView(
        bucketId: _bucketId,
        fileId: fileId,
      );
      return right(fileBytes);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> uploadVideoOnServer({
    required FilePickerResult filePickerResult,
    required String userId,
  }) async {
    final InputFile inputFile;
    if (kIsWeb) {
      inputFile = InputFile(
        bytes: filePickerResult.files.first.bytes,
        filename: filePickerResult.files.first.name,
      );
    } else {
      inputFile = InputFile(
        path: filePickerResult.files.first.path,
        filename: filePickerResult.files.first.name,
      );
    }

    try {
      await _videosStorage.createFile(
        bucketId: _bucketId,
        fileId: 'unique()',
        file: inputFile,
        read: <dynamic>['role:all'],
        write: <dynamic>['user:$userId'],
      );

      return right(unit);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> replaceVideoOnServer({
    required String fileId,
    required String fileName,
    required FilePickerResult filePickerResult,
  }) async {
    final InputFile inputFile;
    if (kIsWeb) {
      inputFile = InputFile(
        bytes: filePickerResult.files.first.bytes,
        filename: fileName,
      );
    } else {
      inputFile = InputFile(
        path: filePickerResult.files.first.path,
        filename: fileName,
      );
    }

    try {
      await _videosStorage.deleteFile(
        bucketId: _bucketId,
        fileId: fileId,
      );
      await _videosStorage.createFile(
        bucketId: _bucketId,
        fileId: fileId,
        file: inputFile,
      );

      return right(unit);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteVideoOnServer(String fileId) async {
    try {
      await _videosStorage.deleteFile(
        bucketId: _bucketId,
        fileId: fileId,
      );

      return right(unit);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }
}
