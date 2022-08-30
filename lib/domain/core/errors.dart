import 'package:video_app/domain/core/failures.dart';

class UnexpectedValueError<F> extends Error {
  final F authValueFailure;

  UnexpectedValueError(this.authValueFailure);

  @override
  String toString() {
    const explanation = 'Encountered a AuthValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $AuthValueFailure');
  }
}
