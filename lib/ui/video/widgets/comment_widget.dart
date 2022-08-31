import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.userName,
    required this.mainComment,
    required this.commentDate,
    required this.subCommentCount,
    required this.onPressed,
  });

  final String userName;
  final String mainComment;
  final DateTime commentDate;
  final int subCommentCount;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              userName,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Container(
              width: 7,
              height: 7,
              margin: const EdgeInsets.symmetric(horizontal: 7),
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
                shape: BoxShape.circle,
              ),
            ),
            Text('${commentDate.day}/${commentDate.month}/${commentDate.year} ${commentDate.hour}:${commentDate.minute}'),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          mainComment,
          textAlign: TextAlign.left,
        ),
        TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          onPressed: () => onPressed(),
          child: Text('$subCommentCount comment'),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class SubCommentWidget extends StatelessWidget {
  const SubCommentWidget({
    super.key,
    required this.userName,
    required this.subComment,
    required this.subCommentDate,
  });

  final String userName;
  final String subComment;
  final DateTime subCommentDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              userName,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Container(
              width: 7,
              height: 7,
              margin: const EdgeInsets.symmetric(horizontal: 7),
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
                shape: BoxShape.circle,
              ),
            ),
            Text('${subCommentDate.day}/${subCommentDate.month}/${subCommentDate.year} ${subCommentDate.hour}:${subCommentDate.minute}'),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          subComment,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
