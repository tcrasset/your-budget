// Flutter imports:
import 'package:flutter/material.dart';

class AccountName extends StatelessWidget {
  final TextStyle textStyle;
  final InputDecoration boxDecoration;
  const AccountName({
    @required this.textStyle,
    @required this.boxDecoration,
  });

  String handleAccountNameValidate(String name) {
    if (name.isEmpty) {
      return 'Please enter an account name';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Add an account",
            style: TextStyle(fontSize: 20),
          ),
        ),
        // SizedBox(
        //   height: 8,
        // ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          // height: 70,
          child: Center(
            child: TextFormField(
              key: const Key('accountNameTextField'),
              decoration: boxDecoration,
              style: textStyle,
              textAlign: TextAlign.center,
              validator: handleAccountNameValidate,
              onSaved: (_) => null,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
      ],
    );
  }
}
