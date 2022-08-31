import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video/comments_cubit/comments_cubit.dart';
import 'package:video_app/application/video/sub_comments_cubit/sub_comments_cubit.dart';
import 'package:video_app/application/video/video_cubit/video_cubit.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/video/comments/comments.dart';
import 'package:video_app/domain/video/comments/comments_failure.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/video/widgets/comment_widget.dart';
import 'package:video_app/ui/video/widgets/loading_widget.dart';
import 'package:video_app/ui/video/widgets/player_widget.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<FormState> _subCommentFormKey = GlobalKey<FormState>();

///Screen to watch video
class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final VideoParams videoParams = ModalRoute.of(context)!.settings.arguments as VideoParams;
    final PageController pageController = PageController();

    return BlocBuilder<UserCubit, UserState>(
      builder: (BuildContext context, UserState userState) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<VideoCubit>(
              create: (BuildContext context) => getIt<VideoCubit>()..init(videoParams.name, videoParams.id),
            ),
            BlocProvider<CommentsCubit>(
              create: (BuildContext context) => getIt<CommentsCubit>(),
            ),
            BlocProvider<SubCommentsCubit>(
              create: (BuildContext context) => getIt<SubCommentsCubit>(),
            ),
          ],
          child: BlocBuilder<VideoCubit, VideoState>(
            builder: (BuildContext context, VideoState state) {
              return state.videoStatus == VideoStatus.deleted
                  ? Scaffold(
                      body: Center(
                        child: Text(
                          'Video deleted',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    )
                  : Layout(
                      id: userState.id,
                      name: userState.name,
                      emailAddress: userState.emailAddress,
                      title: 'Video: ${videoParams.name}',
                      functionOnPop: () {
                        Navigator.of(context).pop();
                        state.chewieController!.videoPlayerController.dispose();
                      },
                      child: state.videoStatus == VideoStatus.loading
                          ? const LoadingWidget(text: 'Loading video...')
                          : state.videoStatus == VideoStatus.replacing
                              ? const LoadingWidget(text: 'Video is updating on the server...')
                              : state.videoStatus == VideoStatus.deleted
                                  ? const LoadingWidget(text: 'Video is deliting on the server...')
                                  : Column(
                                      children: <Widget>[
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height / 3,
                                          child: PlayerWidget(
                                            chewieController: state.chewieController!,
                                            updateVideoFunction: () => BlocProvider.of<VideoCubit>(context).updateVideo(
                                              fileId: videoParams.id,
                                              fileName: videoParams.name,
                                            ),
                                            deleteVideoFunction: () =>
                                                BlocProvider.of<VideoCubit>(context).deleteVideo(videoParams.id),
                                          ),
                                        ),
                                        Expanded(
                                          child: PageView(
                                            controller: PageController(),
                                            onPageChanged: (int page) {
                                              if (page == 1) {
                                                BlocProvider.of<CommentsCubit>(context)
                                                    .loadCommentsOnCommentsPage(videoParams.id);
                                              }
                                            },
                                            children: <Widget>[
                                              PageInfo(
                                                name: videoParams.name,
                                                id: videoParams.id,
                                                updateVideo: () => BlocProvider.of<VideoCubit>(context).updateVideo(
                                                  fileId: videoParams.id,
                                                  fileName: videoParams.name,
                                                ),
                                                deleteVideo: () {
                                                  BlocProvider.of<VideoCubit>(context).deleteVideo(videoParams.id).whenComplete(
                                                    () {
                                                      Navigator.of(context).pop();
                                                      BlocProvider.of<VideoCubit>(context).displayVideo();
                                                    },
                                                  );
                                                },
                                              ),
                                              BlocBuilder<CommentsCubit, CommentsState>(
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
                                                            StreamBuilder<Comments>(
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
                                                                            autovalidateMode: commentsState.showErrorMessage
                                                                                ? AutovalidateMode.always
                                                                                : AutovalidateMode.disabled,
                                                                            child: Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: <Widget>[
                                                                                TextFormField(
                                                                                  onChanged: (String value) =>
                                                                                      BlocProvider.of<CommentsCubit>(context)
                                                                                          .editComment(value),
                                                                                  validator: (String? value) =>
                                                                                      commentsState.comment.value.fold(
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
                                                                                    final String userId =
                                                                                        BlocProvider.of<UserCubit>(context)
                                                                                            .state
                                                                                            .id;
                                                                                    final String userName =
                                                                                        BlocProvider.of<UserCubit>(context)
                                                                                            .state
                                                                                            .name;
                                                                                    BlocProvider.of<CommentsCubit>(context)
                                                                                        .leaveComment(
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
                                                                        final Comment comment =
                                                                            snapshot.data!.comments[index - 1];
                                                                        return CommentWidget(
                                                                          userName: comment.userName,
                                                                          mainComment: comment.comment,
                                                                          commentDate: DateTime.fromMillisecondsSinceEpoch(
                                                                            comment.date,
                                                                          ),
                                                                          subCommentCount: comment.subCommentCount,
                                                                          onPressed: () =>
                                                                              BlocProvider.of<SubCommentsCubit>(context)
                                                                                  .onOpenSubComments(comment.commentId),
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
                                                          if (subCommentsState.isOpen)
                                                            SubCommentsWidget(
                                                              subCommentsCubit: BlocProvider.of<SubCommentsCubit>(context),
                                                              subCommentsState: subCommentsState,
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                    );
            },
          ),
        );
      },
    );
  }
}

///class for transferring data in pushNamed
class VideoParams {
  ///id need to get file. directoryPath need for create path
  const VideoParams({
    required this.name,
    required this.id,
  });

  ///File name on the server
  final String name;

  ///File ID in bucket
  final String id;
}

class PageInfo extends StatelessWidget {
  const PageInfo({
    super.key,
    required this.name,
    required this.id,
    required this.updateVideo,
    required this.deleteVideo,
  });

  final String name;
  final String id;
  final void Function() deleteVideo;
  final void Function() updateVideo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 25),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'File name: ${name}',
                maxLines: 1,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'id: ${id}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => updateVideo(),
          child: Text(
            'Replace video',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        if (kIsWeb) const SizedBox(height: 20) else const SizedBox(height: 5),
        ElevatedButton(
          onPressed: () => deleteVideo(),
          child: Text(
            'Delete video',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}

class SubCommentsWidget extends StatelessWidget {
  const SubCommentsWidget({
    super.key,
    required this.subCommentsCubit,
    required this.subCommentsState,
  });

  final SubCommentsCubit subCommentsCubit;
  final SubCommentsState subCommentsState;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        color: Color(0xFFB3BFFF),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: subCommentsState.loading
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
                if (snapshot.data != null) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.subComments.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Form(
                            key: _subCommentFormKey,
                            autovalidateMode:
                                subCommentsState.showErrorMessage ? AutovalidateMode.always : AutovalidateMode.disabled,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  children: [
                                    IconButton(onPressed: () => subCommentsCubit.openOrClose(), icon: Icon(Icons.arrow_back_rounded),),
                                    Expanded(
                                      child: TextFormField(
                                        onChanged: (String value) => subCommentsCubit.editSubComment(value),
                                        validator: (String? value) => subCommentsState.subComment.value.fold(
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
                        final SubComment comment = snapshot.data!.subComments[index - 1];
                        return SubCommentWidget(
                          userName: comment.userName,
                          subComment: comment.subComment,
                          subCommentDate: DateTime.fromMillisecondsSinceEpoch(
                            comment.date,
                          ),
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
