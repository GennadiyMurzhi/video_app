import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/ui/auth/auth_form.dart';

///screen for authorization/registration
class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(),
    );
  }
}
