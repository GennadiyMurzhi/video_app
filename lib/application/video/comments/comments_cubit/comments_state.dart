part of 'comments_cubit.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState({
    required bool loading,
    required bool showErrorMessage,
    required CommentObject comment,
    required Option<Either<CommentsFailure, dynamic>> commentsFailureOrSuccessOption,
  }) = _CommentsState;

  factory CommentsState.initial() => CommentsState(
        loading: false,
        showErrorMessage: false,
        comment: CommentObject(''),
        commentsFailureOrSuccessOption: none(),
      );
}
