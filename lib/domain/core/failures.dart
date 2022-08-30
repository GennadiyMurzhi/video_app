import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class AuthValueFailure<T> with _$AuthValueFailure<T> {
  const factory AuthValueFailure.wrongName({
    required String failedValue,
  }) = WrongName<T>;

  const factory AuthValueFailure.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;

  const factory AuthValueFailure.shortPassword({
    required String failedValue,
  }) = ShortPassword<T>;
}

@freezed
abstract class CommentValueFailure<T> with _$CommentValueFailure<T> {
  const factory CommentValueFailure.emptyStringComment({
    required String failedValue,
  }) = EmptyStringComment<T>;

  const factory CommentValueFailure.longStringComment({
    required String failedValue,
  }) = LongStringComment<T>;
}
