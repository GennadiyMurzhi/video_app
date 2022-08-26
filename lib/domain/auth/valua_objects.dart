import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_app/domain/auth/validators.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/core/value_objects.dart';

@immutable
class Name extends ValueObject<String>{
  @override
  final Either<AuthValueFailure<String>, String> value;

  factory Name(String input) {
    return Name._(
      validateName(input),
    );
  }

  const Name._(this.value);
}

@immutable
class EmailAddress extends ValueObject<String>{
  @override
  final Either<AuthValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

@immutable
class Password extends ValueObject<String>{
  @override
  final Either<AuthValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}
