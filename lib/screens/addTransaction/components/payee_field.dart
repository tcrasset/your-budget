import 'package:flutter/material.dart';

import '../../../components/rowContainer.dart';

class PayeeField extends StatelessWidget {
  final state; //_AddTransactionPageController
  final TextStyle defaultChildTextStyle;
  final TextStyle selectedChildTextStyle;

  const PayeeField({
    Key key,
    @required this.state,
    @required this.defaultChildTextStyle,
    @required this.selectedChildTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // Payees gesture detectory leading to 'Payees' SelectValuePage
        onTap: state.handleOnTapPayee,
        child: rowContainer(
            "Payee",
            Text(state.payeeFieldName,
                style: (state.payeeFieldName == state.defaultPayeeFieldName)
                    ? defaultChildTextStyle
                    : selectedChildTextStyle)));
  }
}
