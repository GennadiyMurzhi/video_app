import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/auth/auth_cubit/auth_cubit.dart';

///screen that is displayed when the application is started and if the user has finished the session.
///Contains a listener with logic to determine if the user is authorized or not
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) {
        state.map(
          initial: (_) {},
          authenticated: (_)  => Navigator.of(context).pushReplacementNamed('/video_list_screen'),
          unauthenticated: (_) => Navigator.of(context).pushReplacementNamed('/auth_screen'),
        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(height: 30),
              Text(
                'Video App',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const CircularProgressIndicator(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
