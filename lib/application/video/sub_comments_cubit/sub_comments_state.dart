part of 'sub_comments_cubit.dart';

@freezed
abstract class SubCommentsState with _$SubCommentsState {
  const factory SubCommentsState({
    required String mainCommentId,
    required bool isOpen,
    required bool loading,
    required bool showErrorMessage,
    required CommentObject subComment,
    required Option<Either<CommentsFailure, Unit>> subCommentsFailureOrSuccessOption,
  }) = _SubCommentsState;

  factory SubCommentsState.initial() => SubCommentsState(
        mainCommentId: '',
        isOpen: false,
        loading: false,
        subComment: CommentObject(''),
        showErrorMessage: false,
        subCommentsFailureOrSuccessOption: none(),
      );
}
