part of 'sub_comments_cubit.dart';

///state for sub comment cubit
@freezed
abstract class SubCommentsState with _$SubCommentsState {
  ///use value object for storing comment, auxiliary variables to define the state and an option to indicate failures
  const factory SubCommentsState({
    required bool isOpen,
    required bool loading,
    required bool showErrorMessage,
    required CommentObject subComment,
    required String commentId,
    required Option<Either<CommentsFailure, dynamic>> subCommentsFailureOrSuccessOption,
  }) = _SubCommentsState;

  ///use when sub comment widget don`t open
  factory SubCommentsState.initial() => SubCommentsState(
        isOpen: false,
        loading: false,
        subComment: CommentObject(''),
        showErrorMessage: false,
        commentId: '',
        subCommentsFailureOrSuccessOption: none(),
      );
}
