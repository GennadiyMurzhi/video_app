import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

///failures occurring during video manipulation
@freezed
abstract class Failure with _$Failure {
  ///general server error
  const factory Failure.serverError() = ServerError;

  ///used to indicate when user not chosen file
  const factory Failure.fileNotChoose() = FileNotChoose;
}
