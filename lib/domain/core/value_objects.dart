
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:video_app/domain/core/errors.dart';

@immutable
abstract class ValueObject<F, T> {
  const ValueObject();

  Either<F, T> get value;

  T getOrCrash() {
    return value.fold((l) => throw UnexpectedValueError(l), id);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ValueObject<F, T> &&
              runtimeType == other.runtimeType &&
              value == other.value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value{' + ' value: $value,' + '}';
  }

}
