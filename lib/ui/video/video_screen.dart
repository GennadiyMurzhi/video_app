import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video/comments/comments_cubit/comments_cubit.dart';
import 'package:video_app/application/video/comments/edit_old_comments/edit_old_comment_cubit/edit_old_comment_cubit.dart';
import 'package:video_app/application/video/comments/sub_comments_cubit/sub_comments_cubit.dart';
import 'package:video_app/application/video/video_cubit/video_cubit.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/video/widgets/comments_page_widget.dart';
import 'package:video_app/ui/video/widgets/loading_widget.dart';
import 'package:video_app/ui/video/widgets/page_switcher_widget.dart';
import 'package:video_app/ui/video/widgets/player_widget.dart';
import 'package:video_app/ui/video/widgets/video_info_page_widget.dart';

///Screen to watch video
class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final VideoParams videoParams = ModalRoute.of(context)!.settings.arguments as VideoParams;
    final String appUserId = BlocProvider.of<UserCubit>(context).userId;

    final PageController videoPages = PageController();

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
            BlocProvider<EditOldCommentCubit>(
              create: (BuildContext context) => getIt<EditOldCommentCubit>(),
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
                      userId: userState.id,
                      name: userState.name,
                      emailAddress: userState.emailAddress,
                      title: 'Video: ${videoParams.name}',
                      functionOnPop: () {
                        Navigator.of(context).pop();
                        state.chewieController!.videoPlayerController.dispose();
                        //state.chewieController!.dispose();
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
                                        if(kIsWeb) PageSwitcherWidget(pageController: videoPages),
                                        Expanded(
                                          child: PageView(
                                            controller: videoPages,
                                            onPageChanged: (int page) {
                                              if (page == 1) {
                                                BlocProvider.of<CommentsCubit>(context)
                                                    .loadCommentsOnCommentsPage(videoParams.id);
                                              }
                                            },
                                            children: <Widget>[
                                              VideoInfoPageWidget(
                                                name: videoParams.name,
                                                id: videoParams.id,
                                                userId: videoParams.userId,
                                                description: videoParams.description,
                                                appUserId: appUserId,
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
                                              CommentsPageWidget(
                                                videoParams: videoParams,
                                                appUserId: appUserId,
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
    required this.userId,
    required this.description,
  });

  ///File name on the server
  final String name;

  ///File ID in bucket
  final String id;

  ///File user ID who upload on the server
  final String userId;

  ///video description
  final String description;
}
