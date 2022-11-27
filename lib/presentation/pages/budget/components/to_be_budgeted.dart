// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../../../appstate.dart';
import '../../../../models/constants.dart';

class ToBeBudgeted extends StatelessWidget {
  final TextStyle _textStyle = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0);

  final TextStyle _positiveAmountTextStyle =
      const TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
  final TextStyle _negativeAmountTextStyle =
      const TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Text(
              "To be budgeted",
              style: _textStyle,
            ),
          ),
          Expanded(
            child: Text(
              "1000 €",
              style: 1000 >= 0
                  ? _positiveAmountTextStyle
                  : _negativeAmountTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
