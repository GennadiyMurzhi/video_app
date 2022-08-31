part of 'sub_comments_cubit.dart';

@freezed
abstract class SubCommentsState with _$SubCommentsState {
  const factory SubCommentsState({
    required bool isOpen,
    required bool loading,
    required bool showErrorMessage,
    required CommentObject subComment,
    required String commentId,
    required Option<Either<CommentsFailure, dynamic>> subCommentsFailureOrSuccessOption,
  }) = _SubCommentsState;

  factory SubCommentsState.initial() => SubCommentsState(
        isOpen: false,
        loading: false,
        subComment: CommentObject(''),
        showErrorMessage: false,
        commentId: '',
        subCommentsFailureOrSuccessOption: none(),
      );
}
