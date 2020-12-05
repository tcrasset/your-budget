import 'package:flutter/material.dart';
import 'package:your_budget/models/constants.dart';

Future<String> showDeleteDialog(BuildContext context, String warningText) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(warningText),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop("Cancel");
            },
          ),
          FlatButton(
            child: Text('Delete'),
            textColor: Constants.RED_COLOR,
            onPressed: () {
              Navigator.of(context).pop("Delete");
            },
          ),
        ],
      );
    },
  );
}
