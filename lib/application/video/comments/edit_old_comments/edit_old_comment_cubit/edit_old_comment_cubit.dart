import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/video/comments/comments_failure.dart';
import 'package:video_app/domain/video/comments/i_comments_repository.dart';
import 'package:video_app/domain/video/comments/value_objects.dart';

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
    required String oldComment,
    required int commentIndex,
    required String commentId,
  }) {
    emit(
      EditOldCommentState.initial(
        oldComment,
        commentIndex,
        commentId,
      ),
    );
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
  Future<void> endEditComment({required Future<void> Function() updateCommentsFunction}) async {
    final bool isValidComment = state.comment.isValid();
    if (isValidComment) {
      emit(
        state.copyWith(
          loading: false,
        ),
      );

      final Either<CommentsFailure, Unit> successOrFailure = await _commentsRepository.updateMainComment(
        commentId: state.commentId,
        comment: state.comment.getOrCrash(),
      );
      successOrFailure.fold(
        (CommentsFailure l) {
          state.copyWith(
            loading: false,
            editCommentFailureOrSuccessOption: optionOf(successOrFailure),
          );
        },
        (Unit r) async {
          await updateCommentsFunction();
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
