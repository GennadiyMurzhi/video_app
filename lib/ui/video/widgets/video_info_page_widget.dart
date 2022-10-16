import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video/video_cubit/video_cubit.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/video/edit_video/edit_video_screen.dart';
import 'package:video_app/ui/video/widgets/likes_widget.dart';

///a page with information about the video and buttons to delete and change the video, if the user is the one who uploaded it
class VideoInfoPageWidget extends StatelessWidget {
  ///pass video information, and functions for deleting and replacing video
  const VideoInfoPageWidget({
    super.key,
    required this.name,
    required this.id,
    required this.userId,
    required this.userName,
    required this.appUserId,
    required this.userPhotoBits,
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

  ///name of the user who uploaded the video to the server
  final String userName;

  ///user id of the authorized user in the application
  final String appUserId;

  ///video description
  final String description;

  ///user's photo
  final Uint8List? userPhotoBits;

  ///function for deleting video
  final void Function() deleteVideo;

  ///function for updating\displaying video
  final void Function() updateVideo;

  @override
  Widget build(BuildContext context) {
    final bool isAppUserSubscribe = BlocProvider.of<VideoCubit>(context).state.isAppUserSubscribe;

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'File name: $name',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: LikesWidget(
                    likesCount: BlocProvider.of<VideoCubit>(context).state.likesCount,
                    dislikesCount: BlocProvider.of<VideoCubit>(context).state.dislikesCount,
                    isLiked: BlocProvider.of<VideoCubit>(context).state.isUserLiked,
                    isDisLiked: BlocProvider.of<VideoCubit>(context).state.isUserDisliked,
                    likeFunction: () => BlocProvider.of<VideoCubit>(context).likeVideo(isLike: true),
                    dislikeFunction: () => BlocProvider.of<VideoCubit>(context).likeVideo(isLike: false),
                  ),
                ),
              ],
            ),
            /*const SizedBox(height: 10),
            Text(
              'id: ${id}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),*/
            const SizedBox(height: 10),
            Text(
              'Video description: ${description}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                if (userPhotoBits == null)
                  const Icon(
                    Icons.person,
                    size: 40,
                  )
                else
                  ClipOval(
                    child: Image.memory(
                      userPhotoBits!,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(width: 10),
                Text(
                  'User name: $userName',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                if (userId.compareTo(appUserId) != 0) ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      !isAppUserSubscribe ? const Color(0xFF3F3FA2) : const Color(0xFF655E5E),
                    ),
                  ),
                  onPressed: () => !isAppUserSubscribe
                      ? BlocProvider.of<VideoCubit>(context).subscribeOnUser()
                      : BlocProvider.of<VideoCubit>(context).unsubscribeOnUser(),
                  child: !isAppUserSubscribe
                      ? Text(
                          'Subscribe',
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(color: const Color(0xFFE1E1E1)),
                        )
                      : Text(
                          'Unsubscribe',
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(color: const Color(0xFF0D0D5E)),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (userId.compareTo(appUserId) == 0) ...<Widget>[
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(
                    '/edit_video_screen',
                    arguments: EditVideoParams(
                      name: name,
                      description: description,
                      videoId: id,
                      deleteVideo: deleteVideo,
                      updateVideo: updateVideo,
                    ),
                  ),
                  child: Text(
                    'Edit',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
