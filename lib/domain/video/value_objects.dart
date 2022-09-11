import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/core/value_objects.dart';
import 'package:video_app/domain/video/comments/validators.dart';
import 'package:video_app/domain/video/validators.dart';

///Value object contains string comment and validate him
@immutable
class VideoName extends ValueObject<AddVideoValueFailure<String>, String> {
  ///receives input and validate him
  factory VideoName(String input) {
    return VideoName._(
      validateVideoName(input),
    );
  }

  const VideoName._(this.value);

  @override
  final Either<AddVideoValueFailure<String>, String> value;
}

///Value object contains string comment and validate him
@immutable
class VideoDescription extends ValueObject<AddVideoValueFailure<String>, String> {
  ///receives input and validate him
  factory VideoDescription(String input) {
    return VideoDescription._(
      validateVideoDescription(input),
    );
  }

  const VideoDescription._(this.value);

  @override
  final Either<AddVideoValueFailure<String>, String> value;
}

///Value object contains string comment and validate him
@immutable
class VideoFilePickerResult extends ValueObject<AddVideoValueFailure<FilePickerResult?>, FilePickerResult?> {
  ///receives input and validate him
  factory VideoFilePickerResult(FilePickerResult? filePickerResult) {
    return VideoFilePickerResult._(
      validateVideoFilePickerResult(filePickerResult),
    );
  }

  const VideoFilePickerResult._(this.value);

  @override
  final Either<AddVideoValueFailure<FilePickerResult?>, FilePickerResult?> value;
}
