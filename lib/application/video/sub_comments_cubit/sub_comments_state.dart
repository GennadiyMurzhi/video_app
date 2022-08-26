part of 'sub_comments_cubit.dart';

@freezed
abstract class SubCommentsState with _$SubCommentsState {
  const factory SubCommentsState({
    required bool isOpen,
  }) = _SubCommentsState;

  factory SubCommentsState.initial() =>
      const SubCommentsState(
        isOpen: false,
      );
}