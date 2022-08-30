import 'package:dartz/dartz.dart';
import 'package:video_app/domain/core/failures.dart';

Either<AuthValueFailure<String>, String> validateName(String input) {
  print('right $input');
  return _regExpValidate(
    input: input,
    regex: r"""\w*""",
    failure: AuthValueFailure<String>.wrongName(failedValue: input),
  );
}

Either<AuthValueFailure<String>, String> validateEmailAddress(String input) {
  return _regExpValidate(
    input: input,
    regex: r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""",
    failure: AuthValueFailure<String>.invalidEmail(failedValue: input),
  );
}

Either<AuthValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(AuthValueFailure<String>.shortPassword(failedValue: input));
  }
}

Either<AuthValueFailure<String>, String> _regExpValidate({
  required String input,
  required String regex,
  required AuthValueFailure<String> failure,
}) {
  if (RegExp(regex).hasMatch(input)) {
    return right(input);
  } else {
    return left(failure);
  }
}
