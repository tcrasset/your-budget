// Flutter imports:
import 'package:flutter/material.dart';

Future<String?> addDialog({
  required BuildContext context,
  required String title,
  required String hintText,
  required String successButtonName,
  required Function(String) nameValidator,
  String? defaultValue,
}) {
  final TextEditingController textController = TextEditingController();

  if (defaultValue != null && defaultValue.trim() != "") {
    textController.text = defaultValue;
  }

  final formKey = GlobalKey<FormState>();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Form(
          key: formKey,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.grey[200],
            ),
            controller: textController,
            validator: (_) => nameValidator(textController.text) as String?,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.of(context).pop(textController.text);
              }
            },
            child: Text(successButtonName),
          )
        ],
      );
    },
  );
}
