import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/constants.dart';

class ToBeBudgeted extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0);

  final TextStyle _positiveAmountTextStyle =
      new TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
  final TextStyle _negativeAmountTextStyle =
      new TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
                child: Text(
              "To be budgeted",
              style: _textStyle,
            )),
            Consumer<AppState>(
              builder: (context, appState, child) {
                return Text(
                  appState.toBeBudgeted.toStringAsFixed(2) + " €" ??
                      "0.00" + " €",
                  style: appState.toBeBudgeted >= 0
                      ? _positiveAmountTextStyle
                      : _negativeAmountTextStyle,
                );
              },
            )
          ],
        ));
  }
}
