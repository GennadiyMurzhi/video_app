import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/video/sub_comments_cubit/sub_comments_cubit.dart';
import 'package:video_app/application/video/video_cubit/video_cubit.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/video/widgets/loading_widget.dart';
import 'package:video_app/ui/video/widgets/player_widget.dart';
import 'package:video_app/ui/video/widgets/comment_widget.dart';

///Screen to watch video
class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final VideoParams videoParams = ModalRoute.of(context)!.settings.arguments as VideoParams;

    final List<Map<String, dynamic>> comments = List<Map<String, dynamic>>.generate(
      10,
      (int index) => <String, dynamic>{
        'main_comment':
            'main comment $index On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue',
        'sub_comments': List.generate(3, (int index) => 'Test sub comment $index On the other hand, we denounce with righteous...'),
      },
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<VideoCubit>(
          create: (BuildContext context) => getIt<VideoCubit>()..init(videoParams.name, videoParams.id),
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
                                          BlocBuilder<SubCommentsCubit, SubCommentsState>(
                                            builder: (BuildContext context, SubCommentsState state) {
                                              return Stack(
                                                children: <Widget>[
                                                  ListView.builder(
                                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                                    shrinkWrap: true,
                                                    itemCount: comments.length + 1,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      if (index == 0) {
                                                        return Padding(
                                                          padding: EdgeInsets.only(top: 10, bottom: 15),
                                                          child: TextField(
                                                            decoration: InputDecoration(
                                                              isDense: true,
                                                              hintText: 'Enter comment...',
                                                              border: InputBorder.none,
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return CommentWidget(
                                                          personName: 'Person Name',
                                                          mainComment: comments[index - 1]['main_comment'] as String,
                                                          commentDate: DateTime.now(),
                                                          subCommentCount: '20',
                                                          onPressed: () =>
                                                              BlocProvider.of<SubCommentsCubit>(context).openOrClose(),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  if (state.isOpen) SubCommentsWidget(),
                                                ],
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height/3,
        decoration: BoxDecoration(
          color: Color(0xFFB3BFFF),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [


          ],
        ),
    );
  }
}
