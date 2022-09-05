import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/auth/auth_failure.dart';
import 'package:video_app/domain/auth/i_auth_facade.dart';
import 'package:video_app/domain/auth/value_objects.dart';

part 'auth_form_cubit.freezed.dart';
part 'auth_form_state.dart';

///сubit to control the form on the auth_screen and the authorization/registration process
@Injectable()
class AuthFormCubit extends Cubit<AuthFormState> {
  ///pass a facade to use the server's authorization functionality
  AuthFormCubit(this._authFacade) : super(AuthFormState.initial());
  final IAuthFacade _authFacade;

  ///method to return the form to the initial state
  void init() {
    emit(AuthFormState.initial());
  }

  ///method for editing the name of the input time in the form
  void editName(String name) {
    emit(
      state.copyWith(
        name: Name(name),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  ///method for editing the email address of the input time in the form
  void editEmailAddress(String emailAddress) {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(emailAddress),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  ///method for editing the password of the input time in the form
  void editPassword(String password) {
    emit(
      state.copyWith(
        password: Password(password),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  ///method for pressing the registration button
  Future<void> register() async {
    Either<AuthFailure, Unit>? failureOrSuccess;
    if (_isFieldsValid(withName: true)) {
      emit(
        state.copyWith(
          isLoading: true,
          authFailureOrSuccessOption: none(),
        ),
      );
      failureOrSuccess = await _authFacade.register(
        name: state.name,
        emailAddress: state.emailAddress,
        password: state.password,
      );

      failureOrSuccess.fold(
        (AuthFailure l) {
          emit(
            state.copyWith(
              isLoading: false,
              showErrorMessage: true,
              authFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
        (Unit r) {
          emit(
            state.copyWith(
              isLoading: false,
              showErrorMessage: false,
              authFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          showErrorMessage: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ),
      );
    }
  }

  ///method for pushing the login button
  Future<void> signInWithEmailAndPassword() async {
    Either<AuthFailure, Unit>? failureOrSuccess;
    if (_isFieldsValid(withName: false)) {
      emit(
        state.copyWith(
          isLoading: true,
          authFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
        emailAddress: state.emailAddress,
        password: state.password,
      );
      failureOrSuccess.fold(
        (AuthFailure l) {
          emit(
            state.copyWith(
              isLoading: false,
              showErrorMessage: true,
              authFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
        (Unit r) {
          emit(
            state.copyWith(
              isLoading: false,
              showErrorMessage: false,
              authFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          showErrorMessage: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ),
      );
    }
  }

  ///method changes the state to rebuild the form for login or registration
  void switchForm() {
    emit(
      state.copyWith(
        isSignUp: !state.isSignUp,
        showErrorMessage: false,
      ),
    );
  }

  ///actions to be performed upon successful registration/authorization. Pass the function to download the user information
  Future<void> onSuccess({
    required Future<void> Function() loadUserFun,
  }) async {
    if (state.isSignUp) {
      await signInWithEmailAndPassword();
      await loadUserFun();
    } else {
      await loadUserFun();
    }
  }

  bool _isFieldsValid({required bool withName}) {
    if (withName) {
      final bool isName = state.name.isValid();
      final bool isEmailAddress = state.emailAddress.isValid();
      final bool isPassword = state.password.isValid();

      return isName && isEmailAddress && isPassword;
    } else {
      final bool isEmailAddress = state.emailAddress.isValid();
      final bool isPassword = state.password.isValid();

      return isEmailAddress && isPassword;
    }
  }
}
