import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video/add_video_cubit/add_video_cubit.dart';
import 'package:video_app/domain/video/failures.dart';
import 'package:video_app/domain/video/success.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/add_video/add_video_form_widget.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/core/snackbar_custom.dart';

///screen to add video
class AddVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddVideoCubit>(
      create: (BuildContext context) => getIt<AddVideoCubit>(),
      child: BlocConsumer<AddVideoCubit, AddVideoState>(
        builder: (BuildContext context, AddVideoState state) {
          return Layout(
            title: 'Add Video',
            userId: BlocProvider.of<UserCubit>(context).state.id,
            name: BlocProvider.of<UserCubit>(context).state.name,
            emailAddress: BlocProvider.of<UserCubit>(context).state.emailAddress,
            functionOnPop: () {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              Navigator.of(context).pop();
            },
            addAction: () => BlocProvider.of<AddVideoCubit>(context).uploadVideo(BlocProvider.of<UserCubit>(context).state.id),
            child: AddVideoFormWidget(),
          );
        },
        listener: (BuildContext context, AddVideoState state) {
          state.addVideoFailureOrSuccessOption.fold(
            () {},
            (Either<Failure, Success> either) => either.fold(
              (Failure failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBarCustom(
                    text: failure.when(
                      serverError: () => 'Server error',
                    ),
                  ),
                );
              },
              (Success r) {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                Navigator.of(context).pop();
              },
            ),
          );
        },
      ),
    );
  }
}
