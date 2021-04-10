// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:your_budget/models/utils.dart';

class AccountBalance extends StatelessWidget {
  final TextStyle textStyle;
  final InputDecoration boxDecoration;
  const AccountBalance({
    @required this.textStyle,
    @required this.boxDecoration,
  });

  String handleAccountBalanceValidate(String amount) {
    if (amount.isEmpty) {
      return 'Please enter an account balance';
    } else if (!isNumeric(amount)) {
      return 'Insert a valid number';
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
            "with a starting balance of",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: TextFormField(
                key: const Key('accountBalanceTextField'),
                decoration: boxDecoration,
                style: textStyle,
                textAlign: TextAlign.center,
                validator: handleAccountBalanceValidate,
                onSaved: (_) => null,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9-.]"))],
                textInputAction: TextInputAction.done,
              ),
            )),
      ],
    );
  }
}
