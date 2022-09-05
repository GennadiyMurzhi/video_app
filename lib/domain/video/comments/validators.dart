import 'package:dartz/dartz.dart';
import 'package:video_app/domain/core/failures.dart';

///validator for comment value object
Either<CommentValueFailure<String>, String> validateComment(String input) {
  if (input.length > 100) {
    return left(CommentValueFailure<String>.longStringComment(failedValue: input));
  } else if(input.isEmpty) {
    return left(CommentValueFailure<String>.emptyStringComment(failedValue: input));
  } else {
    return right(input);
  }
}
