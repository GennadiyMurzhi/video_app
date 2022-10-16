import 'dart:typed_data';

import 'package:dartz/dartz.dart';

///contract to get user photo
abstract class IPhotoRepository {
  ///get user photo
  Future<Option<Uint8List>> getUserPhoto(String userId);
}
