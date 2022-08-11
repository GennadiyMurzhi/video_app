import 'dart:io';
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/video/video_screen.dart';

///Widget to display VideoData
class VideoListItemWidget extends StatelessWidget {
  ///Initializes [id] for retrieve a file from the server.
  const VideoListItemWidget({
    super.key,
    required this.name,
    required this.id,
  });

  ///File name on the server
  final String name;

  ///File ID in bucket
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: InkWell(
        onTap: () async {
          final Directory directory = await getApplicationDocumentsDirectory();
          Navigator.of(context).push(
            MaterialPageRoute<Widget>(
              builder: (BuildContext context) => VideoScreen(
                name: name,
                id: id,
                directoryPath: directory.path,
              ),
              maintainState: false,
            ),
          );
        },
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFBFE),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0x1F000000),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 16, 0, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                ),
              ),
              // ignore: always_specify_types
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: FutureBuilder<Uint8List>(
                  future: getIt<Storage>().getFilePreview(
                    bucketId: '62e3f62d96bf680e817c',
                    fileId: id,
                  ), //works for both public file and private file, for private files you need to be logged in
                  builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
                    return snapshot.hasData && snapshot.data != null
                        ? ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            child: Image.memory(
                              snapshot.data as Uint8List,
                              width: 100,
                              height: 80,
                              fit: BoxFit.fill,
                            ),
                          )
                        : const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
