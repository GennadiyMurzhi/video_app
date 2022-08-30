import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/video/comments/comments.dart';
import 'package:video_app/domain/video/comments/comments_failure.dart';
import 'package:video_app/domain/video/comments/value_objects.dart';

part 'sub_comments_cubit.freezed.dart';
part 'sub_comments_state.dart';

@Injectable()
class SubCommentsCubit extends Cubit<SubCommentsState> {
  SubCommentsCubit() : super(SubCommentsState.initial());

  void openOrClose() {
    emit(
      state.copyWith(
        isOpen: !state.isOpen,
      ),
    );
    print(state.isOpen);
  }
}
