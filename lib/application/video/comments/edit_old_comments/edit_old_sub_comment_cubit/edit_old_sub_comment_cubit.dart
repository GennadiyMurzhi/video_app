import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_old_sub_comment_state.dart';

class EditOldSubCommentCubit extends Cubit<EditOldSubCommentState> {
  EditOldSubCommentCubit() : super(EditOldSubCommentInitial());
}
