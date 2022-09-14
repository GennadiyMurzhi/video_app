import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///widget that displays when the field is redacted
class WhileEditing extends StatelessWidget {
  ///pass functions to edit information and text for hintText
  const WhileEditing({
    super.key,
    required this.initialValue,
    required this.hintText,
    required this.editValueFunction,
    required this.validator,
    required this.endEditing,
  });

  ///value from which the value editing begins
  final String initialValue;

  ///hint text for text form hint
  final String hintText;

  ///function to edit information value
  final void Function(String) editValueFunction;

  ///function to validate information value
  final String? Function() validator;

  ///function to end editing information value
  final void Function() endEditing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: TextFormField(
            initialValue: initialValue,
            onChanged: (String value) => editValueFunction(value),
            validator: (String? value) => validator(),
            decoration: InputDecoration(hintText: hintText),
          ),
        ),
        IconButton(
          onPressed: () => endEditing(),
          icon: const Icon(
            Icons.edit,
            color: Color(0xFF1D8A99),
          ),
        ),
      ],
    );
  }
}

///widget that displays when the field is not redacted
class WhileNotEditing extends StatelessWidget {
  ///pass the field string and the function to start editing
  const WhileNotEditing({
    super.key,
    required this.fieldString,
    required this.startEditing,
  });

  ///which is the line that will need to be edited
  final String fieldString;

  ///edit start function
  final void Function() startEditing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            fieldString,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        IconButton(
          onPressed: () => startEditing(),
          icon: const Icon(
            Icons.edit,
            color: Color(0xFF7C3F8A),
          ),
        ),
      ],
    );
  }
}
