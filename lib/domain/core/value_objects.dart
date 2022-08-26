
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:video_app/domain/core/errors.dart';
import 'package:video_app/domain/core/failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<AuthValueFailure<T>, T> get value;

  T getOrCrash() {
    return value.fold((l) => throw UnexpectedValueError(l), id);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ValueObject<T> &&
              runtimeType == other.runtimeType &&
              value == other.value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value{' + ' value: $value,' + '}';
  }

}