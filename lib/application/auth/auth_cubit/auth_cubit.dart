import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:video_app/domain/auth/i_auth_facade.dart';
import 'package:video_app/domain/auth/user.dart';

part 'auth_cubit.freezed.dart';

part 'auth_state.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authFacade) : super(AuthState.initial());

  final IAuthFacade _authFacade;

  Future<void> authCheckRequested() async {
    final Option<User> userOption = await _authFacade.getSignedInUser();

    emit(
      userOption.fold(
        () => const AuthState.unauthenticated(),
        (_) => const AuthState.authenticated(),
      ),
    );
  }

  Future<void> signOut() async {
    await _authFacade.signOut();
    emit(const AuthState.unauthenticated());
  }
}
