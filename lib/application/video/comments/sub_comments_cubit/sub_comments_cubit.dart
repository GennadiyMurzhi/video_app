import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/video/comments/comments.dart';
import 'package:video_app/domain/video/comments/comments_failure.dart';
import 'package:video_app/domain/video/comments/i_comments_repository.dart';
import 'package:video_app/domain/video/comments/value_objects.dart';
import 'package:video_app/domain/video/comments/value_transformers.dart';
import 'package:video_app/injectable.dart';

part 'sub_comments_cubit.freezed.dart';

part 'sub_comments_state.dart';

///cubit manage the uploading of sub comments and to leave new
@Injectable()
class SubCommentsCubit extends Cubit<SubCommentsState> {
  ///pass the comments repository to use the comment management functionality
  SubCommentsCubit(this._commentsRepository) : super(SubCommentsState.initial());
  final ICommentsRepository _commentsRepository;
  RealtimeSubscription? _subscription;

  ///method for open subcomments widget
  Future<void> onOpen() async {
    emit(
      state.copyWith(
        isOpen: true,
      ),
    );
  }

  ///method for close sub comments widget
  Future<void> onClose(Future<void> loadComments) async {
    await loadComments;
    emit(
      state.copyWith(
        isOpen: false,
      ),
    );
  }

  ///method for editing the new sub comment of the input time
  void editNewSubComment(String comment) {
    emit(
      state.copyWith(
        subComment: CommentObject(comment),
        subCommentsFailureOrSuccessOption: none(),
      ),
    );
  }

  ///method for loading sub comments when open sub comments widget
  Future<void> onOpenSubComments(String commentId) async {
    emit(
      state.copyWith(
        loading: true,
        commentId: commentId,
        subCommentsCollectionId: subCommentsCollectionId(commentId),
      ),
    );
    _subscriptionOnUpdate();
    onOpen();
    await updateSubComments();
  }

  void _subscriptionOnUpdate() {
    final String subCommentCollectionId = subCommentsCollectionId(state.commentId);
    _subscription = getIt<Realtime>().subscribe(<String>[
      'databases.631960da68ba468f7fe9.collections.$subCommentCollectionId.documents',
    ]);

    _subscription!.stream.listen(
      (RealtimeMessage response) async {
        if (state.isOpen) {
          await updateSubComments();
        }
      },
    );
  }

  ///method for update sub comment
  Future<void> updateSubComments() async {
    final Either<CommentsFailure, SubComments> subCommentsOrFailure =
        await _commentsRepository.getSubComments(state.subCommentsCollectionId);
    subCommentsOrFailure.fold(
      (CommentsFailure l) => emit(
        state.copyWith(
          loading: false,
          subCommentsFailureOrSuccessOption: optionOf(subCommentsOrFailure),
        ),
      ),
      (SubComments r) {
        getIt<DataListReceiver<SubComments>>().getDataList(r);
        emit(
          state.copyWith(
            loading: false,
            subCommentsFailureOrSuccessOption: none(),
          ),
        );
      },
    );
  }

  ///method for leave new sub comment when press leave comment button
  Future<void> leaveSubComment({required String userId, required String userName}) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );

    if (state.subComment.isValid()) {
      final Either<CommentsFailure, Unit> successOrFailure = await _commentsRepository.uploadSubComment(
        subCommentsCollectionId: state.subCommentsCollectionId,
        userId: userId,
        userName: userName,
        subComment: state.subComment.getOrCrash(),
      );
      successOrFailure.fold(
        (CommentsFailure l) => emit(
          state.copyWith(
            loading: false,
            subCommentsFailureOrSuccessOption: optionOf(successOrFailure),
          ),
        ),
        (Unit r) => emit(
          state.copyWith(
            loading: false,
            showErrorMessage: false,
            subCommentsFailureOrSuccessOption: none(),
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          loading: false,
          showErrorMessage: true,
          subCommentsFailureOrSuccessOption: none(),
        ),
      );
    }
  }
}
