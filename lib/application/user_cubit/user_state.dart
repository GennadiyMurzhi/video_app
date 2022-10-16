part of 'user_cubit.dart';

///state for user cubit
@freezed
abstract class UserState with _$UserState {
  ///storing user information
  const factory UserState({
    required String id,
    required String name,
    required String emailAddress,
    required bool loading,
    required UserPhotoFilePickerResult filePickerResult,
    Uint8List? photoBits,
    File? photoFile,
    File? chosenPhotoFile,
    required Option<Either<Failure, dynamic>> userFailureOrSuccessOption,
  }) = _UserState;

  ///initial state contains empty information. Is used until the user information is not loaded
  factory UserState.initial() => UserState(
        id: 'none',
        name: 'none',
        emailAddress: 'none',
        filePickerResult: UserPhotoFilePickerResult(null),
        userFailureOrSuccessOption: none(),
        loading: false,
      );
}
