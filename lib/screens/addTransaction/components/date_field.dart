import 'package:flutter/material.dart';

import '../../../components/rowContainer.dart';

class DateField extends StatelessWidget {
  const DateField({
    Key key,
    @required this.state,
    @required this.selectedChildTextStyle,
  }) : super(key: key);

  final state; //_AddTransactionPageController
  final TextStyle selectedChildTextStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // Date gesture detector
        onTap: () => state.handleOnTapDate(state.context),
        child: rowContainer(
            "Date",
            Text(
              state.dateFieldName,
              style: selectedChildTextStyle,
            )));
  }
}
