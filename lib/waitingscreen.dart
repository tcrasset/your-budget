import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_budget/models/constants.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            color: Constants.PRIMARY_COLOR,
            child: Center(
                child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Constants.SECONDARY_COLOR),
            ))),
      ),
    );
  }
}
