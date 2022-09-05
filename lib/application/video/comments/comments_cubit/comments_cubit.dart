import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/video/comments/comments.dart';
import 'package:video_app/domain/video/comments/comments_failure.dart';
import 'package:video_app/domain/video/comments/i_comments_repository.dart';
import 'package:video_app/domain/video/comments/value_objects.dart';
import 'package:video_app/injectable.dart';

part 'comments_cubit.freezed.dart';
part 'comments_state.dart';

///cubit manage the uploading of comments and to leave new
@Injectable()
class CommentsCubit extends Cubit<CommentsState> {
  ///pass the comments repository to use the comment management functionality
  CommentsCubit(this._commentRepository) : super(CommentsState.initial());

  final ICommentsRepository _commentRepository;

  ///method for editing the new comment of the input time
  void editNewComment(String comment) {
    emit(
      state.copyWith(
        comment: CommentObject(comment),
        commentsFailureOrSuccessOption: none(),
      ),
    );
  }

  ///method to leave new comment
  Future<void> leaveComment({
    required String userId,
    required String userName,
    required String videoId,
  }) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );

    if (state.comment.isValid()) {
      final Either<CommentsFailure, Unit> successOrFailure = await _commentRepository.uploadComment(
        userId: userId,
        userName: userName,
        videoId: videoId,
        comment: state.comment.getOrCrash(),
      );
      successOrFailure.fold(
        (CommentsFailure l) => emit(
          state.copyWith(
            loading: false,
            commentsFailureOrSuccessOption: optionOf(successOrFailure),
          ),
        ),
        (Unit r) async {
          final Either<CommentsFailure, Comments> commentsOrFailure = await _commentRepository.getVideoComments(videoId);
          commentsOrFailure.fold(
            (CommentsFailure l) => emit(
              state.copyWith(
                loading: false,
                commentsFailureOrSuccessOption: optionOf(commentsOrFailure),
              ),
            ),
            (Comments r) {
              emit(
                state.copyWith(
                  loading: false,
                  showErrorMessage: false,
                  commentsFailureOrSuccessOption: none(),
                ),
              );
              getIt<DataListReceiver<Comments>>().getDataList(r);
            },
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          loading: false,
          showErrorMessage: true,
          commentsFailureOrSuccessOption: none(),
        ),
      );
    }
  }

  ///method for loading all comments for video when the comments page opens
  Future<void> loadCommentsOnCommentsPage(String videoId) async {
    emit(state.copyWith(loading: true));

    final Either<CommentsFailure, Comments> commentsOrFailure = await _commentRepository.getVideoComments(videoId);
    commentsOrFailure.fold(
      (CommentsFailure l) => emit(
        state.copyWith(
          loading: false,
          commentsFailureOrSuccessOption: optionOf(commentsOrFailure),
        ),
      ),
      (Comments r) {
        getIt<DataListReceiver<Comments>>().getDataList(r);
        emit(
          state.copyWith(
            loading: false,
            commentsFailureOrSuccessOption: none(),
          ),
        );
      },
    );
  }
}
