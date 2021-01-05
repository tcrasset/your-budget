import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/constants.dart';
import 'CurrencyInputFormatter.dart';

class AmountInputContainer extends StatelessWidget {
  // Create number controller
  /// This [TextFormField] handles the amount selected while providing
  /// an intuitive experience to the user, who does not need to manually
  /// separators and currencies.
  /// The length is limited by a [LengthLimitingTextInputFormatter] to
  /// [state.amountLength] which is equivalent to a maximal value of
  /// 999.999.999,99 €.
  /// The currency format is handled by [CurrencyInputFormatter].
  /// [onTap()] resets the value to a chosen default value.

  AmountInputContainer({
    Key key,
    @required this.state,
  }) : super(key: key);

  final state; //_AddTransactionPageController

  final TextStyle _positiveAmountTextStyle =
      TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
  final TextStyle _negativeAmountTextStyle =
      TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "",
            helperText: "",
            enabledBorder: InputBorder.none,
          ),
          keyboardType: TextInputType.number,
          controller: state.amountController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(state.amountLength),
            CurrencyInputFormatter(
                state.currencyNumberFormat, state.isPositive),
          ],
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.right,
          style: state.isPositive
              ? _positiveAmountTextStyle
              : _negativeAmountTextStyle,
          validator: (value) => state.handleAmountValidate(value),
          // onSaved: state.han dleAmountOnSave(),
          onTap: () => state.handleAmountOnTap(),
        ));
  }
}
