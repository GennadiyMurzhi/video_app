import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.userName,
    required this.mainComment,
    required this.commentDate,
    required this.subCommentCount,
    required this.editable,
    //required this.commentIndex,
    required this.onPressedOnSubCommentCount,
    required this.isEdit,
    required this.startEdit,
    required this.editComment,
    required this.endEdit,
    required this.validator,
    required this.showErrorMessage,
  });

  final String userName;
  final String mainComment;
  final DateTime commentDate;
  final int subCommentCount;
  final bool editable;
  final bool isEdit;
  final bool showErrorMessage;

  //final int commentIndex;
  final void Function() onPressedOnSubCommentCount;
  final void Function() startEdit;
  final void Function(String) editComment;
  final Future<void> Function() endEdit;
  final String? Function(String?) validator;

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
        if (!isEdit)
          Text(
            mainComment,
            textAlign: TextAlign.left,
          )
        else
          Form(
            autovalidateMode: showErrorMessage ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: TextFormField(
              initialValue: mainComment,
              onChanged: (String value) => editComment(value),
              validator: (String? value) => validator(value),
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Edit...',
                border: InputBorder.none,
              ),
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              onPressed: () => onPressedOnSubCommentCount(),
              child: Text('$subCommentCount comment'),
            ),
            if (editable)
              if (!isEdit)
                TextButton(
                  onPressed: () => startEdit(),
                  child: const Text('start edit'),
                )
              else
                TextButton(
                  onPressed: () => endEdit(),
                  child: const Text('end edit'),
                )
          ],
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
    required this.editable,
    //required this.subCommentIndex,
    required this.startEdit,
    required this.editComment,
    required this.endEdit,
  });

  final String userName;
  final String subComment;
  final DateTime subCommentDate;
  final bool editable;

  //final int subCommentIndex;
  final void Function()? startEdit;
  final void Function()? editComment;
  final Future<void> Function()? endEdit;

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
            Text(
                '${subCommentDate.day}/${subCommentDate.month}/${subCommentDate.year} ${subCommentDate.hour}:${subCommentDate.minute}'),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          subComment,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 5),
        if (editable)
          Row(
            children: <Widget>[
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text('edit'),
              ),
            ],
          ),
        const SizedBox(height: 15),
      ],
    );
  }
}
