import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video/comments/edit_old_comments_cubit/edit_old_comment_cubit.dart';
import 'package:video_app/application/video/comments/sub_comments_cubit/sub_comments_cubit.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/video/comments/comments.dart';
import 'package:video_app/domain/video/comments/value_transformers.dart';
import 'package:video_app/enums.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/widgets/user_photo_widget.dart';
import 'package:video_app/ui/video/video_screen.dart';
import 'package:video_app/ui/video/widgets/comment_widget.dart';

final GlobalKey<FormState> _subCommentFormKey = GlobalKey<FormState>();

///widget for displaying sub comments
class SubCommentsWidget extends StatelessWidget {
  ///pass the future to lading sub comments
  const SubCommentsWidget({
    super.key,
    required this.loadComments,
    required this.videoParams,
  });

  ///future to lading sub comments
  final Future<void> Function() loadComments;

  ///video params
  final VideoParams videoParams;

  @override
  Widget build(BuildContext context) {
    final String appUserId = BlocProvider.of<UserCubit>(context).userId;
    print('SubCommentsWidget');

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height / 3,
      decoration: const BoxDecoration(
        color: Color(0xFFBFCCD5),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: BlocProvider.of<SubCommentsCubit>(context).state.loading
          ? const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            )
          : StreamBuilder<SubComments>(
              stream: getIt<DataListReceiver<SubComments>>().dataListStream,
              builder: (BuildContext context, AsyncSnapshot<SubComments> snapshot) {
                print('StreamBuilder<SubComments>');
                if (snapshot.data != null) {
                  return ListView.builder(
                    padding: kIsWeb ? const EdgeInsets.symmetric(horizontal: 120) : const EdgeInsets.symmetric(horizontal: 30),
                    shrinkWrap: true,

                    itemCount: snapshot.data!.subComments.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Form(
                            key: _subCommentFormKey,
                            autovalidateMode: BlocProvider.of<SubCommentsCubit>(context).state.showErrorMessage
                                ? AutovalidateMode.always
                                : AutovalidateMode.disabled,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () => BlocProvider.of<SubCommentsCubit>(context).onClose(loadComments),
                                      icon: const Icon(Icons.arrow_back_rounded),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        onChanged: (String value) =>
                                            BlocProvider.of<SubCommentsCubit>(context).editNewSubComment(value),
                                        validator: (String? value) =>
                                            BlocProvider.of<SubCommentsCubit>(context).state.subComment.value.fold(
                                          (CommentValueFailure<String> l) => l.when(
                                            emptyStringComment: (_) => 'Enter answer',
                                            longStringComment: (_) => 'Long answer',
                                          ),
                                          (String r) {
                                            return null;
                                          },
                                        ),
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          hintText: 'Enter answer...',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final String userId = BlocProvider.of<UserCubit>(context).state.id;
                                    final String userName = BlocProvider.of<UserCubit>(context).state.name;
                                    BlocProvider.of<SubCommentsCubit>(context).leaveSubComment(
                                      userId: userId,
                                      userName: userName,
                                    );
                                  },
                                  child: Text(
                                    'Leave Answer',
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        final SubComment subComment = snapshot.data!.subComments[index - 1];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                            UserPhotoWidget(
                              size: 30,
                              userId: subComment.userId,
                            ),
                            const SizedBox(width: 20),
                            CommentWidget(
                              userName: subComment.userName,
                              editable: appUserId.compareTo(subComment.userId) == 0,
                              comment: subComment.subComment,
                              commentDate: DateTime.fromMillisecondsSinceEpoch(subComment.date),
                              startEdit: () => BlocProvider.of<EditOldCommentCubit>(context).startEditComment(
                                commentCollectionId:
                                    subCommentsCollectionId(BlocProvider.of<SubCommentsCubit>(context).state.commentId),
                                oldComment: subComment.subComment,
                                commentIndex: index - 1,
                                commentId: subComment.subCommentId,
                                commentType: CommentType.subComment,
                              ),
                              editComment: BlocProvider.of<EditOldCommentCubit>(context).editComment,
                              endEdit: () => BlocProvider.of<EditOldCommentCubit>(context).endEditComment(),
                              commentType: CommentType.subComment,
                              isEdit: BlocProvider.of<EditOldCommentCubit>(context).isEditableIndex(index - 1),
                              validator: (String? value) => BlocProvider.of<EditOldCommentCubit>(context).state.comment.value.fold(
                                (CommentValueFailure<String> l) => l.when(
                                  emptyStringComment: (_) => 'Enter comment',
                                  longStringComment: (_) => 'Long Comment',
                                ),
                                (String r) {
                                  return null;
                                },
                              ),
                              showErrorMessage: BlocProvider.of<EditOldCommentCubit>(context).state.showErrorMessage,
                            ),
                          ],
                        );
                      }
                    },
                  );
                } else {
                  return const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
    );
  }
}
