import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/core/value_objects.dart';
import 'package:video_app/domain/video/comments/validators.dart';

@immutable
class CommentObject extends ValueObject<CommentValueFailure<String>, String> {
  @override
  final Either<CommentValueFailure<String>, String> value;

  factory CommentObject(String input) {
    return CommentObject._(
      validateComment(input),
    );
  }

  const CommentObject._(this.value);
}
