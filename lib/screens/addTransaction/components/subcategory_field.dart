// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../components/row_container.dart';
import '../../../models/account.dart';

class SubcategoryField extends StatelessWidget {
  const SubcategoryField({
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
        // Subcategory gesture detectory leading to 'Categories' SelectValuePage

        /// [state.payee] accepts both an object of type [Payee] or [Account].
        /// If it is of type Account, make the GestureDetector untappable,
        /// set the default text style and change the text.
        onTap: () =>
            state.payee is Account ? null : state.handleOnTapCategory(),
        child: rowContainer(
            "Category",
            Text(
                state.payee is Account
                    ? "No subcategory needed"
                    : state.subcategoryFieldName as String,
                style: (state.subcategoryFieldName ==
                            state.defaultSubcategoryFieldName ||
                        state.payee is Account)
                    ? defaultChildTextStyle
                    : selectedChildTextStyle)));
  }
}
