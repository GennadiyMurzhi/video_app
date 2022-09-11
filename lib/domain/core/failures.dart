import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

///auth value failure
@freezed
abstract class AuthValueFailure<T> with _$AuthValueFailure<T> {
  ///failure occurring during the maintenance of an invalid name
  const factory AuthValueFailure.wrongName({
    required String failedValue,
  }) = WrongName<T>;

  ///failure occurring during the maintenance of an invalid email address
  const factory AuthValueFailure.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;

  ///failure occurring during the content of the password of insufficient length
  const factory AuthValueFailure.shortPassword({
    required String failedValue,
  }) = ShortPassword<T>;
}

///comment value failure
@freezed
abstract class CommentValueFailure<T> with _$CommentValueFailure<T> {
  ///failure occurring during the content of an empty string
  const factory CommentValueFailure.emptyStringComment({
    required String failedValue,
  }) = EmptyStringComment<T>;

  ///failure occurring during the content of too large a string
  const factory CommentValueFailure.longStringComment({
    required String failedValue,
  }) = LongStringComment<T>;
}

///add video value failure
@freezed
abstract class AddVideoValueFailure<T> with _$AddVideoValueFailure<T> {
  ///failure occurring during the content of an empty string
  const factory AddVideoValueFailure.emptyStringName({
    required String failedValue,
  }) = EmptyStringName<T>;

  ///failure occurring during the content of too large a string
  const factory AddVideoValueFailure.longStringName({
    required String failedValue,
  }) = LongStringName<T>;

  ///failure occurring during the content of an empty string
  const factory AddVideoValueFailure.emptyStringDescription({
    required String failedValue,
  }) = EmptyStringDescription<T>;

  ///failure occurring during the content of too large a string
  const factory AddVideoValueFailure.longStringDescription({
    required String failedValue,
  }) = LongStringDescription<T>;

  ///failure occurring during the content of too large a string
  const factory AddVideoValueFailure.emptyFilePickerResult({
    required FilePickerResult? failedValue,
  }) = EmptyFilePickerResult<T>;
}
