import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/auth/auth_cubit/auth_cubit.dart';

///This widget is used as a frame for the screens
class Layout extends StatelessWidget {
  ///title for the screen name. Function for Fab adding video. child for screen main content
  const Layout({
    this.layOutKey,
    required this.title,
    this.functionFab,
    this.functionOnPop,
    required this.userId,
    required this.name,
    required this.emailAddress,
    this.addAction,
    required this.child,
  });

  ///key for getting current scaffold context
  final Key? layOutKey;

  ///Title for the app bar
  final String title;

  final String userId;
  final String name;
  final String emailAddress;

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
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            const Icon(
              Icons.person,
              size: 50,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('id: $userId', style: Theme.of(context).textTheme.titleMedium),
                Text('name: $name', style: Theme.of(context).textTheme.titleMedium),
                Text('e-mail: $emailAddress', style: Theme.of(context).textTheme.titleMedium),
              ],
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
              onPressed: () async => functionFab!(userId),
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
