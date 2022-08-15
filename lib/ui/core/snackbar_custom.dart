import 'package:flutter/material.dart';
import 'package:video_app/ui/video_list/video_list_screen.dart';

///Custom snack bar for show message
class SnackBarCustom extends SnackBar {
  ///takes text for displaying on screen
  SnackBarCustom({
    super.key,
    required this.text,
  }) : super(
          behavior: SnackBarBehavior.floating,
          content: Text(text),
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 8),
          duration: const Duration(
            seconds: 2,
            microseconds: 500,
          ),
        );

  ///event name
  final String text;
}

///method for easy show snack bar
void showSnackWithText(String text) => ScaffoldMessenger.of(videoListScreenLayoutKey.currentContext!).showSnackBar(
      SnackBarCustom(text: text),
    );
