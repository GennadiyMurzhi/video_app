import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/auth/auth_cubit/auth_cubit.dart';
import 'package:video_app/application/auth/auth_form_cubit/auth_form_cubit.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/auth/auth_screen.dart';
import 'package:video_app/ui/likes/likes_screen.dart';
import 'package:video_app/ui/splash_screen/splash_screen.dart';
import 'package:video_app/ui/subscriptions/subscription_screen.dart';
import 'package:video_app/ui/upload_video_list/upload_video_list_screen.dart';
import 'package:video_app/ui/user/edit_user_info_screen.dart';
import 'package:video_app/ui/video/add_video/add_video_screen.dart';
import 'package:video_app/ui/video/edit_video/edit_video_screen.dart';
import 'package:video_app/ui/video/video_screen.dart';
import 'package:video_app/ui/video_list/video_list_screen.dart';

///VideoApp
class VideoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => getIt<AuthCubit>()..authCheckRequested(),
        ),
        BlocProvider(
          create: (BuildContext context) => getIt<AuthFormCubit>(),
        ),
        BlocProvider(
          create: (BuildContext context) => getIt<UserCubit>()..init(),
        ),
      ],
      child: MaterialApp(
        title: 'Video App',
        initialRoute: '/splash_screen',
        routes: <String, Widget Function(BuildContext)>{
          '/video_list_screen': (BuildContext context) => VideoListScreen(),
          '/video_screen': (BuildContext context) => VideoScreen(),
          '/auth_screen': (BuildContext context) => AuthScreen(),
          '/splash_screen': (BuildContext context) => SplashScreen(),
          '/add_video_screen': (BuildContext context) => AddVideoScreen(),
          '/edit_video_screen': (BuildContext context) => EditVideoScreen(),
          '/edit_user_info_screen': (BuildContext context) => EditUserInfoScreen(),
          '/likes_screen': (BuildContext context) => LikesScreen(),
          '/subscriptions_screen': (BuildContext context) => SubscriptionsScreen(),
          '/upload_video_list_screen': (BuildContext context) => UploadVideoListScreen(),
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
      ),
    );
  }
}
