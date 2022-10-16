import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_app/domain/core/failures.dart';

///contract to user repository
abstract class IUserRepository {
  ///get user photo
  Future<Option<Uint8List>> getUserPhoto(String userId);

  ///upload user photo
  Future<Either<Failure, Unit>> uploadUserPhoto({
    required FilePickerResult filePickerResult,
    required String userId,
  });

  ///upload user photo
  Future<Either<Failure, Unit>> replaceUserPhoto({
    required FilePickerResult filePickerResult,
    required String userId,
  });
}
