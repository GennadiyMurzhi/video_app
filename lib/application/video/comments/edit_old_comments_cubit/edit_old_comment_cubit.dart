import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/core/errors.dart';
import 'package:video_app/domain/video/comments/comments_failure.dart';
import 'package:video_app/domain/video/comments/i_comments_repository.dart';
import 'package:video_app/domain/video/comments/value_objects.dart';
import 'package:video_app/enums.dart';

part 'edit_old_comment_cubit.freezed.dart';

part 'edit_old_comment_state.dart';

///cubit for manage the editing of old comments
@Injectable()
class EditOldCommentCubit extends Cubit<EditOldCommentState> {
  ///pass the comments repository to use the comment management functionality
  EditOldCommentCubit(this._commentsRepository) : super(EditOldCommentState.none());

  final ICommentsRepository _commentsRepository;

  ///method need to start edit old comment when press edit comment button
  void startEditComment({
    required String commentCollectionId,
    required String oldComment,
    required int commentIndex,
    required String commentId,
    required CommentType commentType,
  }) {
    if (!isClosed) {
      emit(
        EditOldCommentState.initial(
          commentCollectionId,
          oldComment,
          commentIndex,
          commentId,
          commentType,
        ),
      );
    }
  }

  ///method for editing the old comment of the input time
  void editComment(String comment) {
    emit(
      state.copyWith(
        comment: CommentObject(comment),
      ),
    );
  }

  ///method to end edit old comment when press end edit button
  Future<void> endEditComment() async {
    final bool isValidComment = state.comment.isValid();
    if (isValidComment) {
      emit(
        state.copyWith(
          loading: false,
        ),
      );

      final Either<CommentsFailure, Unit> successOrFailure;
      if (state.commentType == CommentType.mainComment) {
        successOrFailure = await _commentsRepository.updateComment(
          commentsCollectionId: state.commentsCollectionId,
          commentId: state.commentId,
          comment: state.comment.getOrCrash(),
        );
      } else if (state.commentType == CommentType.subComment) {
        successOrFailure = await _commentsRepository.updateSubComment(
          subCommentsCollectionId: state.commentsCollectionId,
          subCommentId: state.commentId,
          subComment: state.comment.getOrCrash(),
        );
      } else {
        throw UnexpectedCommentTypeError(state.commentType);
      }

      successOrFailure.fold(
        (CommentsFailure l) {
          state.copyWith(
            loading: false,
            editCommentFailureOrSuccessOption: optionOf(successOrFailure),
          );
        },
        (Unit r) {
          emit(
            state.copyWith(
              loading: false,
              showErrorMessage: false,
              commentIndex: -1,
              editCommentFailureOrSuccessOption: none(),
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          showErrorMessage: true,
        ),
      );
    }
  }

  ///method to check the index if this comment can be edited
  bool isEditableIndex(int index) {
    return state.commentIndex == index;
  }
}
