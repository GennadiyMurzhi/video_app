import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video/add_video_cubit/add_video_cubit.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/video/failures.dart';
import 'package:video_app/injectable.dart';
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
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            userId: BlocProvider.of<UserCubit>(context).state.id,
            name: BlocProvider.of<UserCubit>(context).state.name,
            emailAddress: BlocProvider.of<UserCubit>(context).state.emailAddress,
            functionOnPop: () => Navigator.of(context).pop(),
            addAction: () => BlocProvider.of<AddVideoCubit>(context).uploadVideo(BlocProvider.of<UserCubit>(context).state.id),
            child: Form(
              autovalidateMode: state.showErrorMessage ? AutovalidateMode.always : AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    onChanged: (String value) => BlocProvider.of<AddVideoCubit>(context).editVideoName(value),
                    validator: (String? value) => BlocProvider.of<AddVideoCubit>(context).state.name.value.fold(
                      (AddVideoValueFailure<String> l) => l.maybeMap(
                        emptyStringName: (_) {
                          return 'Enter name video';
                        },
                        longStringName: (_) {
                          return 'Max lenth 120';
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
                    onChanged: (String value) => BlocProvider.of<AddVideoCubit>(context).editVideoDescription(value),
                    validator: (String? value) => BlocProvider.of<AddVideoCubit>(context).state.description.value.fold(
                      (AddVideoValueFailure<String> l) => l.maybeMap(
                        emptyStringDescription: (_) {
                          return 'Enter description video';
                        },
                        longStringDescription: (_) {
                          return 'Max lenth 1024';
                        },
                        orElse: () => null,
                      ),
                      (String r) {
                        return null;
                      },
                    ),
                    decoration: InputDecoration(hintText: 'description'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => BlocProvider.of<AddVideoCubit>(context).pickVideoFile(),
                        child: Text(
                          'Pick video',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      if (state.filePickerResult.isValid()) Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          state.filePickerResult.getOrCrash()!.names[0]!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  if (state.showErrorMessage && state.filePickerResult.isValid() == false)
                    Text(
                      'Select the file',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color(0xFFFF0000),
                          ),
                    ),
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, AddVideoState state) {
          state.addVideoFailureOrSuccessOption.fold(
            () {},
            (Either<Failure, Unit> either) => either.fold(
              (Failure failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBarCustom(
                    text: failure.when(
                      serverError: () => 'Server error',
                    ),
                  ),
                );
              },
              (Unit r) {
                Navigator.of(context).pushReplacementNamed('/video_list_screen');
              },
            ),
          );
        },
      ),
    );
  }
}
