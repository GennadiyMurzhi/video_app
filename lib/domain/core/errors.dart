import 'package:video_app/domain/core/failures.dart';

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
