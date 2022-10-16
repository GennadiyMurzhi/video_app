import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/domain/photo/i_photo_repository.dart';
import 'package:video_app/injectable.dart';

///widget to display user photo
class UserPhotoWidget extends StatelessWidget {
  ///pass need userId to display user photo
  const UserPhotoWidget({
    super.key,
    required this.size,
    required this.userId,
  });

  ///size user widget
  final double size;

  ///user id to display photo
  final String userId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Option<Uint8List>>(
      future: getIt<IPhotoRepository>().getUserPhoto(userId),
      builder: (BuildContext context, AsyncSnapshot<Option<Uint8List>> snapshot) {
        print('object');
        return snapshot.hasData && snapshot.data != null
            ? snapshot.data!.fold(
                () => Icon(
                  Icons.person,
                  size: size,
                ),
                (Uint8List photoBits) => ClipOval(
                  child: Image.memory(
                    photoBits,
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Icon(
                Icons.person,
                size: size,
              );
      },
    );
  }
}
