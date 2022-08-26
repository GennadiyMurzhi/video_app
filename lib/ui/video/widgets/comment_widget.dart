import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.personName,
    required this.mainComment,
    required this.commentDate,
    required this.subCommentCount,
    required this.onPressed,
  });

  final String personName;
  final String mainComment;
  final DateTime commentDate;
  final String subCommentCount;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              personName,
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
        Text(mainComment),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            ),
            onPressed: () => onPressed(),
            child: Text('$subCommentCount comment'),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
