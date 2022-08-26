import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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
