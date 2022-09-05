part of 'auth_form_cubit.dart';

///state for storing form information
@freezed
abstract class AuthFormState with _$AuthFormState {
  ///state use value objects for storing inputs, auxiliary variables to define the state and an option to indicate failures
  const factory AuthFormState({
    ///Value object for storing name input
    required Name name,

    ///Value object for storing email address input
    required EmailAddress emailAddress,

    ///Value object for storing password input
    required Password password,

    ///variable to indicate loading
    required bool isLoading,

    ///variable indicating that the form is needed for registration/authorization
    required bool isSignUp,

    ///variable displaying validate errors in texfields
    required bool showErrorMessage,

    ///option necessary to indicate the further action as a result of the registration/authorization
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _AuthFormState;

  ///initial state. Or a state for zeroing the form
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
