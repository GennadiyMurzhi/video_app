import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video/comments/comments_cubit/comments_cubit.dart';
import 'package:video_app/application/video/comments/edit_old_comments/edit_old_comment_cubit/edit_old_comment_cubit.dart';
import 'package:video_app/application/video/comments/sub_comments_cubit/sub_comments_cubit.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/video/comments/comments.dart';
import 'package:video_app/domain/video/comments/value_transformers.dart';
import 'package:video_app/enums.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/video/video_screen.dart';
import 'package:video_app/ui/video/widgets/comment_widget.dart';
import 'package:video_app/ui/video/widgets/sub_comments_widget.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

///page displaying comments, with the ability to leave new comments and edit old ones
class CommentsPageWidget extends StatelessWidget {
  ///pass the videoParams to know for which video to load the comments. And appUserId to know which comments can be edited
  const CommentsPageWidget({
    super.key,
    required this.videoParams,
    required this.appUserId,
  });

  ///video params
  final VideoParams videoParams;

  ///the user id of the user who is logged in to the application
  final String appUserId;

  @override
  Widget build(BuildContext context) {
    final String commentCollectionId = commentsCollectionId(videoParams.id);
    final String commentId = BlocProvider.of<SubCommentsCubit>(context).state.commentId;
    final String subCommentCollectionId = subCommentsCollectionId(commentId);

    final RealtimeSubscription subscription = getIt<Realtime>().subscribe(<String>[
      'databases.631960756fdf55a5c9c3.collections.$commentCollectionId.documents',
      'databases.631960da68ba468f7fe9.collections.$subCommentCollectionId.documents ',
    ]);
    subscription.stream.listen(
      (RealtimeMessage response) {
        BlocProvider.of<CommentsCubit>(context).loadCommentsOnCommentsPage(videoParams.id);
        if(BlocProvider.of<SubCommentsCubit>(context).state.isOpen) {
          BlocProvider.of<SubCommentsCubit>(context).updateSubComments();
        }
      },
    );

    return BlocBuilder<CommentsCubit, CommentsState>(
      builder: (BuildContext context, CommentsState commentsState) {
        return BlocBuilder<SubCommentsCubit, SubCommentsState>(
          builder: (BuildContext context, SubCommentsState subCommentsState) {
            return Stack(
              children: <Widget>[
                if (commentsState.loading)
                  const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  )
                else
                  BlocBuilder<EditOldCommentCubit, EditOldCommentState>(
                    builder: (BuildContext context, EditOldCommentState editCommentState) {
                      return StreamBuilder<Comments>(
                        stream: getIt<DataListReceiver<Comments>>().dataListStream,
                        builder: (BuildContext context, AsyncSnapshot<Comments> snapshot) {
                          if (snapshot.data != null) {
                            return ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.comments.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                if (index == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                                    child: Form(
                                      key: _formKey,
                                      autovalidateMode:
                                          commentsState.showErrorMessage ? AutovalidateMode.always : AutovalidateMode.disabled,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          TextFormField(
                                            onChanged: (String value) =>
                                                BlocProvider.of<CommentsCubit>(context).editNewComment(value),
                                            validator: (String? value) => commentsState.comment.value.fold(
                                              (CommentValueFailure<String> l) => l.when(
                                                emptyStringComment: (_) => 'Enter comment',
                                                longStringComment: (_) => 'Long Comment',
                                              ),
                                              (String r) {
                                                return null;
                                              },
                                            ),
                                            decoration: const InputDecoration(
                                              isDense: true,
                                              hintText: 'Enter comment...',
                                              border: InputBorder.none,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              final String userId = BlocProvider.of<UserCubit>(context).state.id;
                                              final String userName = BlocProvider.of<UserCubit>(context).state.name;
                                              BlocProvider.of<CommentsCubit>(context).leaveComment(
                                                userId: userId,
                                                userName: userName,
                                                videoId: videoParams.id,
                                              );
                                            },
                                            child: Text(
                                              'Leave Comment',
                                              style: Theme.of(context).textTheme.labelLarge,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  final Comment comment = snapshot.data!.comments[index - 1];
                                  return CommentWidget(
                                    validator: (String? value) => editCommentState.comment.value.fold(
                                      (CommentValueFailure<String> l) => l.when(
                                        emptyStringComment: (_) => 'Enter comment',
                                        longStringComment: (_) => 'Long Comment',
                                      ),
                                      (String r) {
                                        return null;
                                      },
                                    ),
                                    userName: comment.userName,
                                    showErrorMessage: editCommentState.showErrorMessage,
                                    editable: appUserId.compareTo(comment.userId) == 0,
                                    comment: comment.comment,
                                    commentDate: DateTime.fromMillisecondsSinceEpoch(comment.date),
                                    subCommentCount: comment.subCommentCount,
                                    onPressedOnSubCommentCount: () =>
                                        BlocProvider.of<SubCommentsCubit>(context).onOpenSubComments(comment.commentId),
                                    isEdit: BlocProvider.of<EditOldCommentCubit>(context).isEditableIndex(index - 1),
                                    startEdit: () => BlocProvider.of<EditOldCommentCubit>(context).startEditComment(
                                      commentCollectionId: commentsCollectionId(videoParams.id),
                                      oldComment: comment.comment,
                                      commentIndex: index - 1,
                                      commentId: comment.commentId,
                                      commentType: CommentType.mainComment,
                                    ),
                                    editComment: BlocProvider.of<EditOldCommentCubit>(context).editComment,
                                    endEdit: () => BlocProvider.of<EditOldCommentCubit>(context).endEditComment(
                                      updateCommentsFunction: () =>
                                          BlocProvider.of<CommentsCubit>(context).loadCommentsOnCommentsPage(videoParams.id),
                                    ),
                                    commentType: CommentType.mainComment,
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
                      );
                    },
                  ),
                if (subCommentsState.isOpen)
                  SubCommentsWidget(
                    loadComments: BlocProvider.of<CommentsCubit>(context).loadCommentsOnCommentsPage(videoParams.id),
                    videoParams: videoParams,
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
