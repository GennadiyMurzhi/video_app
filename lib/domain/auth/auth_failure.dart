import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

///Failures occurring during authorization\registration
@freezed
abstract class AuthFailure with _$AuthFailure {
  ///general server failure
  const factory AuthFailure.serverError() = ServerError;
  ///failure that occurs if this account is used by another user
  const factory AuthFailure.emailAlreadyInUsed() = EmailAlreadyInUsed;
  ///failure occurring if mismatched user credential were sent to the server
  const factory AuthFailure.invalidEmailAndPasswordCombination() = InvalidEmailAndPasswordCombination;
}
