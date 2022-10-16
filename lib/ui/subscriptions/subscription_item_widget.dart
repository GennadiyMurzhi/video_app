import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/likes_cubit/likes_cubit.dart';
import 'package:video_app/application/subscriptions_cubit/subscriptions_cubit.dart';
import 'package:video_app/ui/core/widgets/user_photo_widget.dart';
import 'package:video_app/ui/video/video_screen.dart';

///widget for display liked video information and display him
class SubscriptionsItemWidget extends StatelessWidget {
  ///pass the required parameters to display the likes
  const SubscriptionsItemWidget({
    super.key,
    required this.userName,
    required this.userId,
  });

  /// to display user name
  final String userName;

  ///for getting user photo
  final String userId;

  @override
  Widget build(BuildContext context) {
    final double previewWidth = MediaQuery.of(context).size.width / 5;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        UserPhotoWidget(size: previewWidth, userId: userId),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(userName, style: Theme.of(context).textTheme.bodyLarge),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF655E5E)),
              ),
              onPressed: () => BlocProvider.of<SubscriptionsCubit>(context).unsibscrebe(userId),
              child: Text(
                'Unsubscribe',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: const Color(0xFF0D0D5E)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
