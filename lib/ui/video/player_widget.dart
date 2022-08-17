import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerWidget extends StatelessWidget {
  PlayerWidget({
    super.key,
    required this.chewieController,
  });

  final ChewieController chewieController;

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: chewieController,
    );
  }

}
