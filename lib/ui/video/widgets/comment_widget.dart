import 'package:flutter/material.dart';

///widget to display a comment on the screen
class CommentWidget extends StatelessWidget {
  ///gets variables for the textfield and functions in case the commentary will be edited
  const CommentWidget({
    super.key,
    required this.userName,
    required this.mainComment,
    required this.commentDate,
    required this.subCommentCount,
    required this.editable,
    required this.onPressedOnSubCommentCount,
    required this.isEdit,
    required this.startEdit,
    required this.editComment,
    required this.endEdit,
    required this.validator,
    required this.showErrorMessage,
  });

  ///the username of the user who left the comment
  final String userName;

  ///the string containing the commentary
  final String mainComment;

  ///date when the commentary was left
  final DateTime commentDate;

  ///the number of sub comments left for the commentary
  final int subCommentCount;

  ///a variable indicating whether the comment can be changed by this user
  final bool editable;

  ///the variable indicating whether or not the comment is being edited now
  final bool isEdit;

  ///a variable indicating whether textfield errors in the comment should be shown now
  final bool showErrorMessage;

  ///function to click on the number of sub comments to open the sub comments widget of this comment
  final void Function() onPressedOnSubCommentCount;

  ///function to start editing a comment
  final void Function() startEdit;

  ///function to edit comment object value
  final void Function(String) editComment;

  ///function for the end of the redacted comment
  final Future<void> Function() endEdit;

  ///function to validate textfield input
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

///widget to display a sub comment on the screen
class SubCommentWidget extends StatelessWidget {
  ///gets variables for the textfield and functions in case the commentary will be edited
  const SubCommentWidget({
    super.key,
    required this.userName,
    required this.subComment,
    required this.subCommentDate,
    required this.editable,
    required this.startEdit,
    required this.editComment,
    required this.endEdit,
  });

  ///the username of the user who left the comment
  final String userName;
  ///the string containing the commentary
  final String subComment;
  ///date when the commentary was left
  final DateTime subCommentDate;

  ///a variable indicating whether the comment can be changed by this user
  final bool editable;
  ///function to start editing a comment
  final void Function() startEdit;

  ///function to edit comment object value
  final void Function(String) editComment;

  ///function for the end of the redacted comment
  final Future<void> Function() endEdit;

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
