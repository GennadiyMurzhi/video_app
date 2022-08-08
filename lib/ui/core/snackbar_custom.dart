import 'package:flutter/material.dart';


///Custom snack bar for show message
class SnackBarCustom extends SnackBar {

  ///takes text for displaying on screen
  SnackBarCustom({
    super.key,
    required this.text,
  }) : super(
          content: Text(text),
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 8),
          duration: const Duration(
            seconds: 2,
            microseconds: 500,
          ),
        );

  ///realtime event name
  final String text;
}
