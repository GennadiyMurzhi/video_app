part of 'edit_old_comment_cubit.dart';

///state for edit old comment cubit
@freezed
abstract class EditOldCommentState with _$EditOldCommentState {
  ///use value object for storing comment, auxiliary variables to define the state and an option to indicate failures
  const factory EditOldCommentState({
    required bool loading,
    required bool editing,
    required bool showErrorMessage,
    required int commentIndex,
    required CommentObject comment,
    required String commentId,
    required Option<Either<CommentsFailure, dynamic>> editCommentFailureOrSuccessOption,
  }) = _EditOldCommentState;

  ///state use whe start editing old comment
  factory EditOldCommentState.initial(String oldComment, int commentIndex, String commentId) => EditOldCommentState(
        loading: false,
        editing: true,
        showErrorMessage: false,
        commentIndex: commentIndex,
        comment: CommentObject(oldComment),
        commentId: commentId,
        editCommentFailureOrSuccessOption: none(),
      );

  ///state is used when a comment is not yet selected for editing
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