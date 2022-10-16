import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_app/domain/core/failures.dart';

///validator for file picker result value object
Either<UserValueFailure<FilePickerResult?>, FilePickerResult?> validateUserPhotoFilePickerResult(FilePickerResult? filePickerResult) {
  if (filePickerResult == null) {
    return left(UserValueFailure<FilePickerResult?>.emptyFilePickerPhotoResult(failedValue: filePickerResult));
  } else {
    return right(filePickerResult);
  }
}
