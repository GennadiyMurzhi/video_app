import 'package:flutter/material.dart';
import 'package:video_app/ui/video_list/video_list_screen.dart';

///VideoApp
class VideoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video App',
      home: VideoListScreen(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
