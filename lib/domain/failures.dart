import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

///Failures that may occur while the application is running
@freezed
abstract class Failure with _$Failure {
  ///Appears when an error has occurred on the server
  const factory Failure.serverError () = ServerError;
}
