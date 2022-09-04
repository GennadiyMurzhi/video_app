part of 'edit_old_comment_cubit.dart';

@freezed
abstract class EditOldCommentState with _$EditOldCommentState {
  const factory EditOldCommentState({
    required bool loading,
    required bool editing,
    required bool showErrorMessage,
    required int commentIndex,
    required CommentObject comment,
    required String commentId,
    required Option<Either<CommentsFailure, dynamic>> editCommentFailureOrSuccessOption,
  }) = _EditOldCommentState;

  factory EditOldCommentState.initial(String oldComment, int commentIndex, String commentId) => EditOldCommentState(
        loading: false,
        editing: true,
        showErrorMessage: false,
        commentIndex: commentIndex,
        comment: CommentObject(oldComment),
        commentId: commentId,
        editCommentFailureOrSuccessOption: none(),
      );

  factory EditOldCommentState.none() => EditOldCommentState(
        loading: false,
        editing: false,
        showErrorMessage: false,
        commentIndex: -1,
        comment: CommentObject(''),
        commentId: '',
        editCommentFailureOrSuccessOption: none(),
      );

}
