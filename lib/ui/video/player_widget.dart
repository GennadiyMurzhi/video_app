import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

///Chewie video player
class PlayerWidget extends StatefulWidget {
  ///blobUrl need to transfer bytes for play video
  const PlayerWidget({
    super.key,
    required this.blobUrl,
  });

  ///url contains video
  final String blobUrl;

  @override
  _StatePlayerWidget createState() => _StatePlayerWidget();
}

class _StatePlayerWidget extends State<PlayerWidget> {
  late VideoPlayerController? _playerController;
  late ChewieController? _chewieController;

  @override
  void initState() {
    _playerController = VideoPlayerController.network(widget.blobUrl);
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
