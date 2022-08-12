import 'package:flutter/material.dart';
import 'package:video_app/ui/video_list/video_list_screen.dart';

///Custom snack bar for show message
class SnackBarCustom extends SnackBar {
  ///takes text for displaying on screen
  SnackBarCustom({
    super.key,
    required this.text,
  }) : super(
          content: Text(text),
          duration: const Duration(
            seconds: 2,
            microseconds: 500,
          ),
        );

  ///realtime event name
  final String text;
}

///method for easy show snack bar
void showSnackWithText(String text) => ScaffoldMessenger.of(videoListScreenLayoutKey.currentContext!).showSnackBar(
      SnackBarCustom(text: text),
    );
