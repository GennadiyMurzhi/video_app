part of 'user_cubit.dart';

///state for user cubit
@freezed
abstract class UserState with _$UserState {
  ///storing user information
  const factory UserState({
    required String id,
    required String name,
    required String emailAddress,
  }) = _UserState;

  ///initial state contains empty information. Is used until the user information is not loaded
  factory UserState.initial() => const UserState(
        id: 'none',
        name: 'none',
        emailAddress: 'none',
      );
}
