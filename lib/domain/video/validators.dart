import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_app/domain/core/failures.dart';

///validator for video name value object
Either<AddVideoValueFailure<String>, String> validateVideoName(String input) {
  if (input.length > 120) {
    return left(AddVideoValueFailure<String>.longStringName(failedValue: input));
  } else if(input.isEmpty) {
    return left(AddVideoValueFailure<String>.emptyStringName(failedValue: input));
  } else {
    return right(input);
  }
}

///validator for video description value object
Either<AddVideoValueFailure<String>, String> validateVideoDescription(String input) {
  if (input.length > 1024) {
    return left(AddVideoValueFailure<String>.longStringDescription(failedValue: input));
  } else if(input.isEmpty) {
    return left(AddVideoValueFailure<String>.emptyStringDescription(failedValue: input));
  } else {
    return right(input);
  }
}

///validator for file picker result value object
Either<AddVideoValueFailure<FilePickerResult?>, FilePickerResult?> validateVideoFilePickerResult(FilePickerResult? filePickerResult) {
  if (filePickerResult == null) {
    return left(AddVideoValueFailure<FilePickerResult?>.emptyFilePickerResult(failedValue: filePickerResult));
  } else {
    return right(filePickerResult);
  }
}
