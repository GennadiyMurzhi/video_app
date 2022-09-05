import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/core/value_objects.dart';
import 'package:video_app/domain/video/comments/validators.dart';

///Value object contains string comment and validate him
@immutable
class CommentObject extends ValueObject<CommentValueFailure<String>, String> {
  ///receives input and validate him
  factory CommentObject(String input) {
    return CommentObject._(
      validateComment(input),
    );
  }

  const CommentObject._(this.value);

  @override
  final Either<CommentValueFailure<String>, String> value;
}
