import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/user/i_user_repository.dart';

const String _bucketPhotoId = '6331920b37c4ada48ccd';

///class for manipulation user data
@Injectable(as: IUserRepository)
class UserRepository extends IUserRepository {
  ///pass the storage to user photo manipulation
  UserRepository(this._storage);

  final Storage _storage;

  @override
  Future<Option<Uint8List>> getUserPhoto(String userId) async {
    try {
      final Uint8List photo = await _storage.getFileView(
        bucketId: _bucketPhotoId,
        fileId: 'photo_$userId',
      );

      return optionOf(photo);
    } on AppwriteException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return optionOf(null);
    }
  }

  @override
  Future<Either<Failure, Unit>> uploadUserPhoto({
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
      await _storage.createFile(
        bucketId: _bucketPhotoId,
        fileId: 'photo_$userId',
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
  Future<Either<Failure, Unit>> replaceUserPhoto({
    required FilePickerResult filePickerResult,
    required String userId,
  }) async {
    try {
      await _storage.deleteFile(
        bucketId: _bucketPhotoId,
        fileId: 'photo_$userId',
      );

      final Either<Failure, Unit> res = await uploadUserPhoto(
        filePickerResult: filePickerResult,
        userId: userId,
      );

      return res;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left(const Failure.serverError());
    }
  }
}
