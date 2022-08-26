import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

class PlayerWidget extends StatelessWidget {
  PlayerWidget({
    super.key,
    required this.chewieController,
    required this.updateVideoFunction,
    required this.deleteVideoFunction,
  });

  final ChewieController chewieController;
  Future<void> Function() updateVideoFunction;
  Future<void> Function() deleteVideoFunction;

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: chewieController.copyWith(
        additionalOptions: (BuildContext context) => <OptionItem>[
          OptionItem(
            onTap: () => updateVideoFunction(),
            iconData: Icons.repeat,
            title: 'Replace Video',
          ),
          OptionItem(
            onTap: () => deleteVideoFunction(),
            iconData: Icons.delete,
            title: 'Delete Video',
          ),
        ],
      ),
    );
  }
}
