import 'package:flutter/material.dart';

Future<String> addDialog(
    {@required BuildContext context,
    @required String title,
    @required String hintText,
    @required String successButtonName,
    @required Function(String) nameValidator,
    String defaultValue}) {
  TextEditingController textController = TextEditingController();

  if (defaultValue != null && defaultValue.trim() != "") {
    textController.text = defaultValue;
  }

  final _formKey = GlobalKey<FormState>();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Form(
            key: _formKey,
            child: TextFormField(
              decoration: new InputDecoration(
                  hintText: hintText,
                  filled: true,
                  fillColor: Colors.grey[200]),
              controller: textController,
              validator: (_) => nameValidator(textController.text),
            ),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.of(context).pop(textController.text);
                  }
                },
                child: Text(successButtonName))
          ],
        );
      });
}
