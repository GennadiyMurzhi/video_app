import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:video_app/domain/auth/i_auth_facade.dart';
import 'package:video_app/domain/user/user.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

///cubit to store and determine the state of the user on the server
@Injectable()
class AuthCubit extends Cubit<AuthState> {
  ///pass a facade to use the server's authorization functionality
  AuthCubit(this._authFacade) : super(const AuthState.initial());

  final IAuthFacade _authFacade;

  ///method for detected user session on the server
  Future<void> authCheckRequested() async {
    final Option<User> userOption = await _authFacade.getSignedInUser();
    print('auth cubit check ');
    emit(
      userOption.fold(
        () => const AuthState.unauthenticated(),
        (_) => const AuthState.authenticated(),
      ),
    );
  }

  ///method for sign out user on the server
  Future<void> signOut() async {
    await _authFacade.signOut();
    emit(const AuthState.unauthenticated());
  }
}
