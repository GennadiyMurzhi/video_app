import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerWidget extends StatefulWidget {
  final File file;

  const PlayerWidget({
    super.key,
    required this.file,
  });

  @override
  _StatePlayerWidget createState() => _StatePlayerWidget();
}

class _StatePlayerWidget extends State<PlayerWidget> {
  VideoPlayerController? _playerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    _playerController = VideoPlayerController.file(widget.file);
    _chewieController = ChewieController(
      videoPlayerController: _playerController!,
      autoInitialize: true,
    );

    super.initState();
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
      controller: _chewieController!,
    );
  }
}
