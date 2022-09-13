import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection(Environment.prod);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
  );

  runApp(VideoApp());
}
