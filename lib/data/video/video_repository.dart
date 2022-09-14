import 'dart:convert';
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/video/failures.dart';
import 'package:video_app/domain/video/i_video_repository.dart';
import 'package:video_app/domain/video/success.dart';
import 'package:video_app/domain/video/video.dart';

const String _bucketId = '62e3f62d96bf680e817c';
const String _videoDataCollectionId = '631b4f2663f40f701b38';

///Repository for video
@Injectable(as: IVideoRepository)
class VideoRepository implements IVideoRepository {
  ///Repository constructor receives the videos [storage] to manipulate files on the servers
  VideoRepository(this._videosStorage, this._client) {
    _database = Databases(
      _client,
      databaseId: '62e3faba8623b7647567',
    );
    _functions = Functions(_client);
  }

  late final Functions _functions;
  late final Databases _database;
  final Client _client;
  final Storage _videosStorage;

  @override
  Future<Either<Failure, VideoDataList>> getVideoList() async {
    try {
      final DocumentList documentList = await _database.listDocuments(
        collectionId: '631b4f2663f40f701b38',
        orderAttributes: ['\$createdAt'],
        orderTypes: ['DESC'],
      );
      return right(VideoDataList.fromDocumentList(documentList.documents));
    } catch (e) {
      print(e);
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, VideoData>> getDataForVideo(String videoDataDocumentId) async {
    try {
      final Document document = await _database.getDocument(
        collectionId: '631b4f2663f40f701b38',
        documentId: videoDataDocumentId,
      );
      return right(VideoData.fromDocument(document));
    } catch (e) {
      print(e);
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
  Future<Either<Failure, Success>> uploadVideoOnServer({
    required FilePickerResult filePickerResult,
    required String userId,
    required String name,
    required String description,
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
      final File uploadFileResult = await _videosStorage.createFile(
        bucketId: _bucketId,
        fileId: 'unique()',
        file: inputFile,
        read: <dynamic>['role:all'],
        write: <dynamic>['user:$userId'],
      );
      final Map<String, dynamic> functionData = <String, dynamic>{
        'video_id' : uploadFileResult.$id,
        'name' : name,
        'description' : description,
      };
      await _functions.createExecution(functionId: 'onUploadVideo', data: jsonEncode(functionData));
      print( jsonEncode(functionData));
      return right(const Success.videoUploaded());
    } catch (e) {
      print(e);
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Success>> replaceVideoOnServer({
    required String fileId,
    required String fileName,
    required FilePickerResult filePickerResult,
    required String userId,
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
        read: <dynamic>['role:all'],
        write: <dynamic>['user:$userId'],
      );

      return right(const Success.videoReplaced());
    } catch (e) {
      print(e);
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Success>> deleteVideoOnServer(String fileId) async {
    try {
      await _videosStorage.deleteFile(
        bucketId: _bucketId,
        fileId: fileId,
      );

      return right(const Success.videoDeleted());
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Success>> updateVideoInformation({required String videoId, String? name, String? description}) async {
    final bool isName = name != null;
    final bool isDescription = description != null;
    if(isName || isDescription) {
      try {
        final Map<dynamic, dynamic> data;
        if(isName && isDescription) {
          data = <dynamic, dynamic>{
            'name': name,
            'description': description
          };
        } else if(isName) {
          data = <dynamic, dynamic>{
            'name': name,
          };
        } else {
          data = <dynamic, dynamic>{
            'description': description,
          };
        }
        await _database.updateDocument(collectionId: _videoDataCollectionId, documentId: 'video_data_$videoId', data: data);
        return right(const Success.videoInfoUpdated());
      } catch (e){
        print(e);
        return left(const Failure.serverError());
      }
    } else {
      throw Exception('Unexpected combination to update video information in method updateVideoInformation');
    }
  }
}
