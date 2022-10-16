import 'package:flutter/material.dart';

///Like widget for video
class LikesWidget extends StatelessWidget {
  ///pass like or dislike
  const LikesWidget({
    super.key,
    required this.isLiked,
    required this.isDisLiked,
    required this.likeFunction,
    required this.dislikeFunction,
    required this.likesCount,
    required this.dislikesCount,
  });

  ///function for like button
  final void Function() likeFunction;

  ///function for dislike button
  final void Function() dislikeFunction;

  ///variable to detect like
  final bool isLiked;

  ///variable to detect dislike
  final bool isDisLiked;

  ///likes count
  final int likesCount;

  ///dislikes
  final int dislikesCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(likesCount.toString()),
        _LikeIconWidget(
          isLike: true,
          fill: isLiked,
          onPressed: () => likeFunction(),
        ),
        Text(dislikesCount.toString()),
        _LikeIconWidget(
          isLike: false,
          fill: isDisLiked,
          onPressed: () => dislikeFunction(),
        ),
      ],
    );
  }
}

class _LikeIconWidget extends StatelessWidget {
  const _LikeIconWidget({
    super.key,
    required this.isLike,
    required this.fill,
    required this.onPressed,
  });

  final bool isLike;

  final bool fill;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 16,
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      icon: Icon(
        IconData(
          isLike ? 0xf164 : 0xf165,
          fontFamily: 'Like_icons',
        ),
      ),
      color: fill ? const Color(0xFF3F3FA2) : const Color(0xFFA1A1A1),
      onPressed: () => onPressed(),
    );
  }
}
