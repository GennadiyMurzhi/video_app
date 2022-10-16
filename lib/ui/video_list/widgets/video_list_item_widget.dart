import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/video_list_cubit/video_list_cubit.dart';
import 'package:video_app/domain/photo/i_photo_repository.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/video/video_screen.dart';

///Widget to display VideoData
class VideoListItemWidget extends StatelessWidget {
  ///Initializes [id] for retrieve a file from the server.
  const VideoListItemWidget({
    super.key,
    required this.name,
    required this.id,
    required this.userId,
    required this.description,
  });

  ///File name on the server
  final String name;

  ///File ID in bucket
  final String id;

  ///User ID who file created
  final String userId;

  ///video description
  final String description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/video_screen',
          arguments: VideoParams(
            id: id,
          ),
        );
      },
      child: Container(
        height: 230,
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          //borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0x99000000),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          verticalDirection: VerticalDirection.up,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 16, 0, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder<Option<Uint8List>>(
                      future: getIt<IPhotoRepository>().getUserPhoto(userId),
                      builder: (BuildContext context, AsyncSnapshot<Option<Uint8List>> snapshot) {
                        return snapshot.hasData && snapshot.data != null
                            ? snapshot.data!.fold(
                                () => const Icon(
                                  Icons.person,
                                  size: 35,
                                ),
                                (Uint8List photoBits) => ClipOval(
                                  child: Image.memory(
                                    photoBits,
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : const SizedBox(width: 35);
                      },
                    ),
                    const SizedBox(width: 15),
                    Column(
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
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // ignore: always_specify_types
            FutureBuilder<Uint8List?>(
              future: BlocProvider.of<VideoListCubit>(context).getVideoPreview(id),
              //works for both public file and private file, for private files you need to be logged in
              builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
                return snapshot.hasData && snapshot.data != null
                    ? _PreviewContainer(
                        child: Image.memory(
                          (snapshot.data as Uint8List?)!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const _PreviewContainer(
                        child: Icon(
                          Icons.video_collection_outlined,
                          size: 30,
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviewContainer extends StatelessWidget {
  const _PreviewContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: const Color(0xFFEAEDF0),
      alignment: Alignment.center,
      child: child,
    );
  }
}
