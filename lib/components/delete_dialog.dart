// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../models/constants.dart';

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
              Navigator.of(context).pop("Cancel");
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
