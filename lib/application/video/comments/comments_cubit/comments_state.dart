part of 'comments_cubit.dart';

///state for comments cubit
@freezed
class CommentsState with _$CommentsState {
  ///use value object for storing comment, auxiliary variables to define the state and an option to indicate failures
  const factory CommentsState({
    required bool loading,
    required bool showErrorMessage,
    required String videoFileId,
    required CommentObject comment,
    required Option<Either<CommentsFailure, dynamic>> commentsFailureOrSuccessOption,
  }) = _CommentsState;

  ///initial state need when comment not loaded
  factory CommentsState.initial() => CommentsState(
        videoFileId: '',
        loading: false,
        showErrorMessage: false,
        comment: CommentObject(''),
        commentsFailureOrSuccessOption: none(),
      );
}
