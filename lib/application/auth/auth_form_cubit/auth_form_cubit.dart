import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/auth/auth_failure.dart';
import 'package:video_app/domain/auth/i_auth_facade.dart';
import 'package:video_app/domain/auth/value_objects.dart';

part 'auth_form_cubit.freezed.dart';

part 'auth_form_state.dart';

@Injectable()
class AuthFormCubit extends Cubit<AuthFormState> {
  AuthFormCubit(this._authFacade) : super(AuthFormState.initial());
  final IAuthFacade _authFacade;

  void editName(String name) {
    emit(
      state.copyWith(
        name: Name(name),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  void editEmailAddress(String emailAddress) {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(emailAddress),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  void editPassword(String password) {
    emit(
      state.copyWith(
        password: Password(password),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

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

      print('state.isLoading');
      print(state.isLoading);
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          showErrorMessage: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ),
      );
      print(state.showErrorMessage);
    }
  }

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

  void switchForm() {
    emit(state.copyWith(isSignUp: !state.isSignUp));
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
