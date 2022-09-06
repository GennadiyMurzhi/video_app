import 'package:video_app/enums.dart';

///error throw when an unexpected value was obtained
class UnexpectedValueError<F> extends Error {
  /// pass the failure
  UnexpectedValueError(this.valueFailure);

  ///value failure
  final F valueFailure;

  @override
  String toString() {
    const String explanation = 'Encountered a AuthValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}

///error throw when an unexpected value was obtained
class UnexpectedCommentTypeError extends Error {
  /// pass the CommentType
  UnexpectedCommentTypeError(this.commentType);

  ///ContentType value
  final CommentType commentType;

  @override
  String toString() {
    const String explanation = 'Encountered a CommentType at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation commen type was: $commentType');
  }
}
