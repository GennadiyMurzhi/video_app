import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_app/domain/auth/validators.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/core/value_objects.dart';

///Value object contains name and validate him
@immutable
class Name extends ValueObject<AuthValueFailure<String>, String> {
  ///receives input and validate him
  factory Name(String input) {
    return Name._(
      validateName(input),
    );
  }

  const Name._(this.value);

  @override
  final Either<AuthValueFailure<String>, String> value;
}

///Value object contains email address and validate him
@immutable
class EmailAddress extends ValueObject<AuthValueFailure<String>, String> {
  ///receives input and validate him
  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);

  @override
  final Either<AuthValueFailure<String>, String> value;
}

///Value object contains password and validate him
@immutable
class Password extends ValueObject<AuthValueFailure<String>, String> {
  ///receives input and validate him
  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);

  @override
  final Either<AuthValueFailure<String>, String> value;
}
