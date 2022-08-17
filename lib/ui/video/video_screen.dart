import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/video_cubit/video_cubit.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/video/loading_widget.dart';
import 'package:video_app/ui/video/player_widget.dart';

///Screen to watch video
class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final VideoParams videoParams = ModalRoute.of(context)!.settings.arguments as VideoParams;

    return BlocProvider<VideoCubit>(
      create: (BuildContext context) => getIt<VideoCubit>()..init(videoParams.name, videoParams.id),
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
                              : SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height / 2,
                                        child: PlayerWidget(
                                          chewieController: state.chewieController!,
                                        ),
                                      ),
                                      const SizedBox(height: 25),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'File name: ${videoParams.name}',
                                              maxLines: 1,
                                              style: Theme.of(context).textTheme.titleLarge,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'id: ${videoParams.id}',
                                              style: Theme.of(context).textTheme.bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () => BlocProvider.of<VideoCubit>(context).updateVideo(
                                          fileId: videoParams.id,
                                          fileName: videoParams.name,
                                        ),
                                        child: Text(
                                          'Replace video',
                                          style: Theme.of(context).textTheme.labelLarge,
                                        ),
                                      ),
                                      if (kIsWeb) const SizedBox(height: 20) else const SizedBox(height: 5),
                                      ElevatedButton(
                                        onPressed: () {
                                          BlocProvider.of<VideoCubit>(context).deleteVideo(videoParams.id).whenComplete(() {
                                            Navigator.of(context).pop();
                                            BlocProvider.of<VideoCubit>(context).displayVideo();
                                          });
                                        },
                                        child: Text(
                                          'Delete video',
                                          style: Theme.of(context).textTheme.labelLarge,
                                        ),
                                      ),
                                    ],
                                  ),
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
