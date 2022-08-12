import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/video/player_widget.dart';

///Screen to watch video
class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final VideoParams videoParams = ModalRoute.of(context)!.settings.arguments as VideoParams;

    return Layout(
      title: 'Video: ${videoParams.name}',
      functionOnPop: () {
        //File('${videoParams.directoryPath}/${videoParams.id}.mp4').delete();
        Navigator.of(context).pop();
      },
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: FutureBuilder<List<int>>(
              future: getIt<Storage>().getFileView(
                bucketId: '62e3f62d96bf680e817c',
                fileId: videoParams.id,
              ),
              builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  //final File file = File('${videoParams.directoryPath}/${videoParams.id}.mp4');
                  //file.writeAsBytesSync(snapshot.data as List<int>);
                  final html.Blob blob = html.Blob(snapshot.data as List<int>);
                  final String blobUrl = html.Url.createObjectUrlFromBlob(blob);
                  return PlayerWidget(blobUrl: blobUrl);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  videoParams.name,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  videoParams.id,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///class for transferring data in pushNamed
class VideoParams {
  ///id need to get file. directoryPath need for create path
  const VideoParams({
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
}
