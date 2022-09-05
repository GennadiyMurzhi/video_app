import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:video_app/domain/core/errors.dart';

///abstract class for value object containing a value check and a value getter
@immutable
abstract class ValueObject<F, T> {
  ///gets Either containing a value, or failure
  const ValueObject();

  ///containing a value, or failure
  Either<F, T> get value;

  ///getter throwing an error in case of an unexpected value
  T getOrCrash() {
    return value.fold((F l) => throw UnexpectedValueError<F>(l), id);
  }

  ///method for checking the right value
  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is ValueObject<F, T> && runtimeType == other.runtimeType && value == other.value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value{' + ' value: $value,' + '}';
  }
}
