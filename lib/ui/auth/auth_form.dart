import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/auth/auth_form_cubit/auth_form_cubit.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/domain/auth/auth_failure.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/ui/core/snackbar_custom.dart';

///Form widget for authorization\registration
class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthFormCubit>(context).init();

    return BlocConsumer<AuthFormCubit, AuthFormState>(
      builder: (BuildContext context, AuthFormState state) {
        return Form(
          key: _formKey,
          autovalidateMode: state.showErrorMessage ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              const SizedBox(height: 120),
              Text(
                'Video app',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 57),
              if (state.isSignUp)
                TextFormField(
                  onChanged: (String value) => BlocProvider.of<AuthFormCubit>(context).editName(value),
                  validator: (String? value) => BlocProvider.of<AuthFormCubit>(context).state.name.value.fold(
                    (AuthValueFailure<String> l) => l.maybeMap(
                      wrongName: (_) {
                        return 'Enter Name';
                      },
                      orElse: () => null,
                    ),
                    (String r) {
                      return null;
                    },
                  ),
                  decoration: InputDecoration(hintText: 'name'),
                ),
              TextFormField(
                onChanged: (String value) => BlocProvider.of<AuthFormCubit>(context).editEmailAddress(value),
                validator: (String? value) => BlocProvider.of<AuthFormCubit>(context).state.emailAddress.value.fold(
                  (AuthValueFailure<String> l) => l.maybeMap(
                    invalidEmail: (_) {
                      return 'Incorrect email Address';
                    },
                    orElse: () => null,
                  ),
                  (String r) {
                    return null;
                  },
                ),
                decoration: InputDecoration(hintText: 'e-mail'),
              ),
              TextFormField(
                onChanged: (String value) => BlocProvider.of<AuthFormCubit>(context).editPassword(value),
                validator: (String? value) => BlocProvider.of<AuthFormCubit>(context).state.password.value.fold(
                  (AuthValueFailure<String> l) => l.maybeMap(
                    shortPassword: (_) {
                      return 'Short password';
                    },
                    orElse: () => null,
                  ),
                  (String r) {
                    return null;
                  },
                ),
                obscureText: true,
                decoration: InputDecoration(hintText: 'password'),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 105),
                child: ElevatedButton(
                  onPressed: () {
                    //_formKey.currentState!.reset();
                    state.isSignUp
                        ? BlocProvider.of<AuthFormCubit>(context).register()
                        : BlocProvider.of<AuthFormCubit>(context).signInWithEmailAndPassword();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF7C3F8A),
                    ),
                  ),
                  child: Text(
                    state.isSignUp ? 'Sign Up' : "Sign In",
                  ),
                ),
              ),
              if (state.isLoading)
                Column(
                  children: const <Widget>[
                    SizedBox(height: 10),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              else
                TextButton(
                  onPressed: () {
                    _formKey.currentState!.reset();
                    BlocProvider.of<AuthFormCubit>(context).switchForm();
                  },
                  child: Text(state.isSignUp ? 'already have an account ?' : 'don\'t have an account yet?'),
                ),
            ],
          ),
        );
      },
      listener: (BuildContext context, AuthFormState state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (Either<AuthFailure, Unit> either) => either.fold(
            (AuthFailure failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBarCustom(
                  text: failure.when(
                    serverError: () => 'Server error',
                    emailAlreadyInUsed: () => 'Email already in use',
                    invalidEmailAndPasswordCombination: () => 'Invalid email and password combination',
                  ),
                ),
              );
            },
            (Unit r) {
              BlocProvider.of<AuthFormCubit>(context).onSuccess(loadUserFun: BlocProvider.of<UserCubit>(context).loadUserData);
              Navigator.of(context).pushReplacementNamed('/video_list_screen');
            },
          ),
        );
      },
    );
  }
}
