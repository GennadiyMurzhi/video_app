import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VideoInfoPageWidget extends StatelessWidget {
  const VideoInfoPageWidget({
    super.key,
    required this.name,
    required this.id,
    required this.userId,
    required this.appUserId,
    required this.updateVideo,
    required this.deleteVideo,
  });

  final String name;
  final String id;
  final String userId;
  final String appUserId;
  final void Function() deleteVideo;
  final void Function() updateVideo;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}