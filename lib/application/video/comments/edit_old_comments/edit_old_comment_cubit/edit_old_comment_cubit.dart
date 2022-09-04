import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:video_app/application/video/comments/comments_cubit/comments_cubit.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/video/comments/comments.dart';
import 'package:video_app/domain/video/comments/comments_failure.dart';
import 'package:video_app/domain/video/comments/i_comments_repository.dart';
import 'package:video_app/domain/video/comments/value_objects.dart';
import 'package:video_app/injectable.dart';

part 'edit_old_comment_cubit.freezed.dart';

part 'edit_old_comment_state.dart';

@Injectable()
class EditOldCommentCubit extends Cubit<EditOldCommentState> {
  EditOldCommentCubit(this._commentsRepository) : super(EditOldCommentState.none());

  final ICommentsRepository _commentsRepository;

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

  void editComment(String comment) {
    emit(
      state.copyWith(
        comment: CommentObject(comment),
      ),
    );
  }

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

  bool isEditableIndex(int index) {
    return state.commentIndex == index;
  }
}
