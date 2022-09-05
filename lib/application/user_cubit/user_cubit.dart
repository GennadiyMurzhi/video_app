import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/auth/i_auth_facade.dart';
import 'package:video_app/domain/auth/user.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

///cubit for store information about authorized users
@Injectable()
class UserCubit extends Cubit<UserState> {
  ///pass a facade to use the server's authorization functionality
  UserCubit(this._authFacade) : super(UserState.initial());

  final IAuthFacade _authFacade;

  ///method for load user information into the application
  Future<void> loadUserData() async {
    final Option<User> user = await _authFacade.getSignedInUser();
    user.fold(() => null, (User a) {
      emit(
        UserState(
          id: a.id,
          name: a.name,
          emailAddress: a.email,
        ),
      );
    });
  }

  ///application user id
  String get userId => state.id;
}
