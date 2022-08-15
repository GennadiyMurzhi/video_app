import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

///Chewie video player
class PlayerWidget extends StatefulWidget {
  ///If this platform is pass the bucketId that contains the video and the fileId of the file another pass the file
  const PlayerWidget({
    super.key,
    this.videoLink,
    this.videoFile,
  });

  ///video link for playing video on the web
  final String? videoLink;

  ///file with video need to play video on all platform without web
  final File? videoFile;

  @override
  _StatePlayerWidget createState() => _StatePlayerWidget();
}

class _StatePlayerWidget extends State<PlayerWidget> {
  late VideoPlayerController? _playerController;
  late ChewieController? _chewieController;

  @override
  void initState() {
    if (kIsWeb) {
      _playerController = VideoPlayerController.network(widget.videoLink!);
    } else {
      _playerController = VideoPlayerController.file(widget.videoFile!);
    }
    _chewieController = ChewieController(
      videoPlayerController: _playerController!,
      autoInitialize: true,
    );

    super.initState();
  }

  @override
  void didUpdateWidget (PlayerWidget old) {
    super.didUpdateWidget(old);
    if (kIsWeb) {
      _playerController = VideoPlayerController.network(widget.videoLink!);
    }
  }

  @override
  void dispose() {
    _playerController!.dispose();
    _chewieController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      key: UniqueKey(),
      controller: _chewieController!,
    );
  }
}
