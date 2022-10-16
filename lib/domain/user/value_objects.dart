import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/core/value_objects.dart';
import 'package:video_app/domain/user/validators.dart';

///Value object contains filepicker result and check him contains on null
@immutable
class UserPhotoFilePickerResult extends ValueObject<UserValueFailure<FilePickerResult?>, FilePickerResult?> {
  ///receives input and validate him
  factory UserPhotoFilePickerResult(FilePickerResult? filePickerResult) {
    return UserPhotoFilePickerResult._(
      validateUserPhotoFilePickerResult(filePickerResult),
    );
  }

  const UserPhotoFilePickerResult._(this.value);

  @override
  final Either<UserValueFailure<FilePickerResult?>, FilePickerResult?> value;
}
