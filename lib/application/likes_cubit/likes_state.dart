part of 'likes_cubit.dart';

@freezed
abstract class LikesState with _$LikesState {
  const factory LikesState({
    required bool loading,
    required Option<Either<Failure, Unit>> likesFailureOrSuccessOption,
  }) = _LikesState;

  factory LikesState.init() => LikesState(
    loading: true,
    likesFailureOrSuccessOption: none(),
  );
}

