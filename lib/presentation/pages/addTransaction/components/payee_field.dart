// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../components/row_container.dart';

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
        onTap: state.handleOnTapPayee as Function(),
        child: RowContainer(
            name: "Payee",
            childWidget: Text(state.payeeFieldName as String,
                style: (state.payeeFieldName == state.defaultPayeeFieldName)
                    ? defaultChildTextStyle
                    : selectedChildTextStyle)));
  }
}
