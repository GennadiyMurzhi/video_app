import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.mainComment, required this.subComments});

  final String mainComment;
  final List<String> subComments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(mainComment),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: List<Widget>.generate(subComments.length, (int index) => Text(subComments[index])) ,
          ),
        ),
      ],
    );
  }
}
