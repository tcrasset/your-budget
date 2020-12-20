import 'package:flutter/material.dart';

import '../../../components/rowContainer.dart';

class AccountField extends StatelessWidget {
  const AccountField({
    Key key,
    @required this.state,
    @required this.defaultChildTextStyle,
    @required this.selectedChildTextStyle,
  }) : super(key: key);

  final state; //_AddTransactionPageController
  final TextStyle defaultChildTextStyle;
  final TextStyle selectedChildTextStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // Accounts gesture detectory leading to 'Accounts' SelectValuePage
        onTap: () => state.handleOnTapAccount(),
        child: rowContainer(
            "Account",
            Text(state.accountFieldName,
                style: (state.accountFieldName == state.defaultAccountFieldName)
                    ? defaultChildTextStyle
                    : selectedChildTextStyle)));
  }
}
