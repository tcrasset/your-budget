// Flutter imports:
import 'package:flutter/material.dart';

Future<String?> showDeleteDialog(BuildContext context, String warningText) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(warningText),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(null);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop("Delete");
            },
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}
