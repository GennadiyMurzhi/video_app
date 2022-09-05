part of 'auth_cubit.dart';

///state for auth cubit
@freezed
abstract class AuthState with _$AuthState {
  ///state for indicating the moment of initialization
  const factory AuthState.initial() = Iinitial;

  ///state indicating that the user is authenticated
  const factory AuthState.authenticated() = Authenticated;

  ///state indicating that the user is unauthenticated
  const factory AuthState.unauthenticated() = Unauthenticated;
}
