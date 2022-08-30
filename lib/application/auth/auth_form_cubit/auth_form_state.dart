part of 'auth_form_cubit.dart';

@freezed
abstract class AuthFormState with _$AuthFormState {
  const factory AuthFormState({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
    required bool isLoading,
    required bool isSignUp,
    required bool showErrorMessage,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _AuthFormState;

  factory AuthFormState.initial() => AuthFormState(
        name: Name(''),
        emailAddress: EmailAddress(''),
        password: Password(''),
        isSignUp: true,
        isLoading: false,
        showErrorMessage: false,
        authFailureOrSuccessOption: none(),
      );
}
