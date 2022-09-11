import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///a page with information about the video and buttons to delete and change the video, if the user is the one who uploaded it
class VideoInfoPageWidget extends StatelessWidget {
  ///pass video information, and functions for deleting and replacing video
  const VideoInfoPageWidget({
    super.key,
    required this.name,
    required this.id,
    required this.userId,
    required this.appUserId,
    required this.updateVideo,
    required this.deleteVideo,
    required this.description,
  });

  ///vide name
  final String name;

  ///video id on the server
  final String id;

  ///id of the user who uploaded the video to the server
  final String userId;

  ///user id of the authorized user in the application
  final String appUserId;

  ///video description
  final String description;

  ///function for deleting video
  final void Function() deleteVideo;

  ///function for updating\displaying video
  final void Function() updateVideo;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 25),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'File name: ${name}',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'id: ${id}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  'User id: ${userId}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  'Video description: ${description}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (userId.compareTo(appUserId) == 0) ...<Widget>[
            ElevatedButton(
              onPressed: () => updateVideo(),
              child: Text(
                'Replace video',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            if (kIsWeb) const SizedBox(height: 20) else const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () => deleteVideo(),
              child: Text(
                'Delete video',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
