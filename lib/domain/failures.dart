import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

///Failures that may occur while the application is running
@freezed
abstract class Failure with _$Failure {
  ///Appears when the user canceled the video upload
  const factory Failure.cancelledByUser() = CancelledByUser;
  ///Appears when the user has selected the wrong video format
  const factory Failure.wrongFileFormat () = WrongFileFormat;
  ///Appears when an error has occurred on the server
  const factory Failure.serverError () = ServerError;
}
