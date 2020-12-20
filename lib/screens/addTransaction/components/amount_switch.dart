
import 'package:flutter/material.dart';
import 'package:your_budget/models/constants.dart';

class AmountSwitch extends StatelessWidget {
  const AmountSwitch({
    Key key,
    @required this.state,
  }) : super(key: key);

  final  state; //_AddTransactionPageController

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Switch(
      value: state.isPositive,
      onChanged: (_) => state.handleSwitchOnChanged(),
      activeTrackColor: Constants.GREEN_COLOR,
      activeColor: Colors.grey[300],
      activeThumbImage: new AssetImage("assets/plus.png"),
      inactiveThumbImage: new AssetImage("assets/minus.png"),
      inactiveTrackColor: Constants.RED_COLOR,
      inactiveThumbColor: Colors.grey[300],
    ));
  }
}
