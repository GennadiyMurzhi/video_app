import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/photo/i_photo_repository.dart';

const String _bucketPhotoId = '6331920b37c4ada48ccd';

///repository for manipulation with photo
@Injectable(as: IPhotoRepository)
class PhotoRepository implements IPhotoRepository {
  ///pass the storage to user photo manipulation
  PhotoRepository(this._storage);

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
}
