import 'package:flutter/material.dart';
import 'package:video_app/ui/video_list/video_list_screen.dart';

///This widget is used as a frame for the screens
class Layout extends StatelessWidget {
  ///title for the screen name. Function for Fab adding video. child for screen main content
  const Layout({
    super.key,
    required this.title,
    required this.functionFab,
    required this.child,
  });

  ///Title for the app bar
  final String title;

  ///Function for Fab adding video
  final Future<void> Function() functionFab;

  ///Main content
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: videoListScreenLayoutKey,
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: const Color(0xFFFFFFFF)),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFFFFFFFF),
        ),
      ),
      floatingActionButton: ElevatedButton(
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
        onPressed: () async => functionFab(),
        child: const Icon(
          Icons.add,
          size: 24,
        ),
      ),
      body: child,
    );
  }
}
