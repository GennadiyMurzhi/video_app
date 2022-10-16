import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/likes_cubit/likes_cubit.dart';
import 'package:video_app/application/video_list_cubit/video_list_cubit.dart';
import 'package:video_app/ui/video/video_screen.dart';

///widget for display liked video information and display him
class UploadVideoListItemWidget extends StatelessWidget {
  ///pass the required parameters to display the likes
  const UploadVideoListItemWidget({
    super.key,
    required this.videoName,
    required this.videoId,
  });

  /// to display video name
  final String videoName;

  ///for getting video preview
  final String videoId;

  @override
  Widget build(BuildContext context) {
    final double previewWidth = MediaQuery.of(context).size.width / 2.5;

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/video_screen', arguments: VideoParams(id: videoId)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: previewWidth,
            height: previewWidth * 0.6,
            child: FutureBuilder<Uint8List?>(
              future: BlocProvider.of<VideoListCubit>(context).getVideoPreview(videoId),
              builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
                if (snapshot.data != null && snapshot.hasData) {
                  return Image.memory(snapshot.data!,fit: BoxFit.cover,);
                } else {
                  return Container();
                }
              },
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(videoName, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 5),
            ],
          ),
        ],
      ),
    );
  }
}
