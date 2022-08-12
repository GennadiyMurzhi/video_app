import 'package:flutter/material.dart';
import 'package:video_app/ui/video/video_screen.dart';
import 'package:video_app/ui/video_list/video_list_screen.dart';

///VideoApp
class VideoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video App',
      initialRoute: '/video_list_creen',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      routes: <String, Widget Function(BuildContext)>{
        '/video_list_creen': (BuildContext context) => VideoListScreen(),
        '/video_screen': (BuildContext context) => VideoScreen(),
      },
    );
  }
}
