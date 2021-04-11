// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:your_budget/domain/account/new_account.dart';
import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/constants.dart';

class AccountRow extends StatelessWidget {
  const AccountRow({
    @required this.account,
  });
  final NewAccount account;

  @override
  Widget build(BuildContext context) {
    const TextStyle positiveAmountTextStyle =
        TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
    const TextStyle negativeAmountTextStyle = TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);
    const TextStyle _accountNameStyle = TextStyle(fontSize: 25, fontStyle: FontStyle.italic);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Text(
            account.name.getOrCrash(),
            style: _accountNameStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          account.balance.getOrCrash().toStringAsFixed(2) + " €",
          style: account.balance.getOrCrash().isNegative
              ? negativeAmountTextStyle
              : positiveAmountTextStyle,
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
        )
      ],
    );
  }
}
