import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/auth/auth_cubit/auth_cubit.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/ui/core/snackbar_custom.dart';

///This widget is used as a frame for the screens
class Layout extends StatelessWidget {
  ///title for the screen name. Function for Fab adding video. child for screen main content
  const Layout({
    this.layOutKey,
    required this.title,
    this.functionFab,
    this.functionOnPop,
    this.addAction,
    required this.child,
  });

  ///key for getting current scaffold context
  final Key? layOutKey;

  ///Title for the app bar
  final String title;

  ///Function for Fab
  final dynamic Function(dynamic)? functionFab;

  ///Function for back button
  final void Function()? functionOnPop;

  ///function if need add video
  final Future<void> Function()? addAction;

  ///Main content
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: layOutKey ?? layOutKey,
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: const Color(0xFFFFFFFF)),
        ),
        leading: functionOnPop != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => functionOnPop!(),
              )
            : null,
        actions: addAction != null
            ? <Widget>[
                IconButton(
                  onPressed: () => addAction!(),
                  icon: const Icon(Icons.done),
                )
              ]
            : null,
        centerTitle: true,
      ),
      drawer: BlocConsumer<UserCubit, UserState>(
        listener: (BuildContext context, UserState state) {
          state.userFailureOrSuccessOption.fold(
            () => null,
            (Either<Failure, dynamic> a) => a.fold(
              (Failure l) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBarCustom(
                  text: l.when(
                    serverError: () => 'Server error',
                    fileNotChoose: () => 'File not choose',
                  ),
                ),
              ),
              (dynamic r) => null,
            ),
          );
        },
        builder: (BuildContext context, UserState state) {
          return Drawer(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/edit_user_info_screen'),
                  child: _UserPhotoWidget(
                    key: UniqueKey(),
                    sizePhoto: 100,
                    photoBits: state.photoBits,
                    photoFile: state.photoFile,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('id: ${state.id}', style: Theme.of(context).textTheme.titleMedium),
                    Text('name: ${state.name}', style: Theme.of(context).textTheme.titleMedium),
                    Text('e-mail: ${state.emailAddress}', style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed('/likes_screen'),
                  child: const Text('Likes'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed('/subscriptions_screen'),
                  child: const Text('Subscriptions'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed('/video_list_screen'),
                  child: const Text('Video list'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/upload_video_list_screen');
                  },
                  child: const Text('Uploaded videos'),
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).signOut();
                    Navigator.of(context).pushReplacementNamed('/auth_screen');
                  },
                  child: const Text('Sign out'),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: functionFab != null
          ? ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                fixedSize: MaterialStateProperty.all<Size>(const Size(56, 56)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF673AB7)),
              ),
              onPressed: () async => functionFab!(BlocProvider.of<UserCubit>(context).state.id),
              child: const Icon(
                Icons.add,
                size: 24,
              ),
            )
          : null,
      body: child,
    );
  }
}

class _UserPhotoWidget extends StatelessWidget {
  const _UserPhotoWidget({
    super.key,
    required this.sizePhoto,
    this.photoBits,
    this.photoFile,
  });

  final double sizePhoto;
  final Uint8List? photoBits;
  final File? photoFile;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      if (photoBits == null) {
        return Icon(
          Icons.person,
          size: sizePhoto,
        );
      } else {
        return ClipOval(
          child: Image.memory(
            photoBits!,
            width: sizePhoto,
            height: sizePhoto,
            fit: BoxFit.cover,
          ),
        );
      }
    } else {
      if (photoFile == null) {
        return Icon(
          Icons.person,
          size: sizePhoto,
        );
      } else {
        return ClipOval(
          child: Image.file(
            photoFile!,
            width: sizePhoto,
            height: sizePhoto,
            fit: BoxFit.cover,
          ),
        );
      }
    }
  }
}
