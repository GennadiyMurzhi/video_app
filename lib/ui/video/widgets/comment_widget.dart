import 'package:flutter/material.dart';
import 'package:video_app/enums.dart';

///widget to display a comment on the screen
class CommentWidget extends StatelessWidget {
  ///gets variables for the textfield and functions in case the commentary will be edited
  const CommentWidget({
    super.key,
    required this.userName,
    required this.comment,
    required this.commentDate,
    this.subCommentCount,
    required this.editable,
    this.onPressedOnSubCommentCount,
    required this.isEdit,
    required this.startEdit,
    required this.editComment,
    required this.endEdit,
    required this.validator,
    required this.showErrorMessage,
    required this.commentType,
  });

  ///the username of the user who left the comment
  final String userName;

  ///the string containing the commentary
  final String comment;

  ///date when the commentary was left
  final DateTime commentDate;

  ///the number of sub comments left for the commentary
  final int? subCommentCount;

  ///a variable indicating whether the comment can be changed by this user
  final bool editable;

  ///the variable indicating whether or not the comment is being edited now
  final bool? isEdit;

  ///a variable indicating whether textfield errors in the comment should be shown now
  final bool? showErrorMessage;

  ///function to click on the number of sub comments to open the sub comments widget of this comment
  final void Function()? onPressedOnSubCommentCount;

  ///function to start editing a comment
  final void Function()? startEdit;

  ///function to edit comment object value
  final void Function(String)? editComment;

  ///function for the end of the redacted comment
  final Future<void> Function()? endEdit;

  ///function to validate textfield input
  final String? Function(String?)? validator;

  ///CommentType for detect whether or not the sub comment widget open button should be displayed
  final CommentType commentType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
        if (isEdit! && isEdit != null)
          Form(
            autovalidateMode: showErrorMessage! ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: SizedBox(
              width: 150,
              child: TextFormField(
                initialValue: comment,
                onChanged: (String value) => editComment!(value),
                validator: (String? value) => validator!(value),
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: 'Edit...',
                  border: InputBorder.none,
                ),
              ),
            ),
          )
        else
          Text(
            comment,
            textAlign: TextAlign.left,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (commentType == CommentType.mainComment)
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                ),
                onPressed: () => onPressedOnSubCommentCount!(),
                child: Text('$subCommentCount answer'),
              ),
            if (editable)
              if (!isEdit!)
                TextButton(
                  onPressed: () {
                        startEdit!();
                        print('startEdit!();');
                  },
                  child: const Text('start edit'),
                )
              else
                TextButton(
                  onPressed: () => endEdit!(),
                  child: const Text('end edit'),
                )
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
