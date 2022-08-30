part of 'user_cubit.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    required String id,
    required String name,
    required String emailAddress,
  }) = _UserState;

  factory UserState.initial() => UserState(
    id: 'none',
    name: 'none',
    emailAddress: 'none',
  );
}
