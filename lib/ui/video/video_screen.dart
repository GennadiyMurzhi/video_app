import 'dart:io';
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/video/player_widget.dart';

///Screen to watch video
class VideoScreen extends StatelessWidget {
  ///id needed to get file
  const VideoScreen({
    super.key,
    required this.name,
    required this.id,
    required this.directoryPath,
  });

  ///File name on the server
  final String name;

  ///File ID in bucket
  final String id;

  ///Directory path for create file
  final String directoryPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          FutureBuilder<Uint8List>(
            future: getIt<Storage>().getFileView(
              bucketId: '62e3f62d96bf680e817c',
              fileId: id,
            ),
            builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final File file = File('$directoryPath/$id.mp4');
                file.writeAsBytesSync(snapshot.data as List<int>);

                return PlayerWidget(file: file);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          Text(
            name,
            maxLines: 1,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Text(
            id,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
