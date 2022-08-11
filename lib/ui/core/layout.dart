import 'package:flutter/material.dart';

///This widget is used as a frame for the screens
class Layout extends StatelessWidget {
  ///title for the screen name. Function for Fab adding video. child for screen main content
  const Layout({
    this.layOutKey,
    required this.title,
    this.functionFab,
    this.functionOnPop,
    required this.child,
  });

  ///key for getting current scaffold context
  final Key? layOutKey;

  ///Title for the app bar
  final String title;

  ///Function for Fab
  final Future<void> Function()? functionFab;

  ///Function for back button
  final void Function()? functionOnPop;

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
        centerTitle: true,
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
              ),
              onPressed: () async => functionFab!(),
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
