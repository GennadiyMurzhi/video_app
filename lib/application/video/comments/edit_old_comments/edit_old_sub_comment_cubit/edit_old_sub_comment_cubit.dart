import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:video_app/domain/video/comments/i_comments_repository.dart';

part 'edit_old_sub_comment_state.dart';

///edit old sub comment
@Injectable()
class EditOldSubCommentCubit extends Cubit<EditOldSubCommentState> {
  ///pass the comments repository to use the comment management functionality
  EditOldSubCommentCubit(this._commentsRepository) : super(EditOldSubCommentInitial());

  final ICommentsRepository _commentsRepository;


}
