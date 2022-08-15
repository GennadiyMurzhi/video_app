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
      routes: <String, Widget Function(BuildContext)>{
        '/video_list_creen': (BuildContext context) => VideoListScreen(),
        '/video_screen': (BuildContext context) => VideoScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: Color(0xFF6750A4)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 24,
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFFFBFE)),
          ),
        ),
      ),
    );
  }
}
