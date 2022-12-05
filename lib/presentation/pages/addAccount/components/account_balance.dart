// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:your_budget/application/addAccount/account_creator/account_creator_bloc.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/amount_input_row.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/currency_input_formatter.dart';

class AccountBalance extends HookWidget {
  final TextStyle textStyle;
  final InputDecoration boxDecoration;
  const AccountBalance({
    required this.textStyle,
    required this.boxDecoration,
  });

  void onBalanceChanged(BuildContext context, String value) {
    context.read<AccountCreatorBloc>().add(AccountCreatorEvent.balanceChanged(value));
  }

  String? _failNameClosure(dynamic f) {
    final result = f.maybeMap(
      invalidAmount: (_) => "Must be a valid amount",
      tooBigAmount: (_) => "Must be smaller than ${Amount.MAX_VALUE}",
      orElse: () => null,
    );

    return result is String ? result : null;
  }

  String? validateBalance(BuildContext context) {
    return context.read<AccountCreatorBloc>().state.account.balance.value.fold(
          (f) => _failNameClosure(f),
          (_) => null,
        );
  }

  String? handleAccountBalanceValidate(String amount) {
    if (amount.isEmpty) {
      return 'Please enter an account balance';
    } else if (!isNumeric(amount)) {
      return 'Insert a valid number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller =
        useTextEditingController(text: CurrencyOperations.zero);

    return BlocConsumer<AccountCreatorBloc, AccountCreatorState>(
      listenWhen: (p, c) => getBalance(p) != getBalance(c),
      listener: (context, state) {
        _controller
          ..text = getBalance(state)!
          ..selection = TextSelection.collapsed(offset: _controller.text.length);
      },
      builder: (context, state) {
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
                  controller: _controller,
                  textAlign: TextAlign.center,
                  validator: (_) => validateBalance(context),
                  onChanged: (value) => onBalanceChanged(context, value),
                  onTap: () => onBalanceChanged(context, CurrencyOperations.zero),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    CurrencyInputFormatter(Constants.CURRENCY_FORMAT, true)
                  ],
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

String? getBalance(AccountCreatorState state) => state.account.balance.value.fold(
      (_) => null,
      (v) => CurrencyOperations.formatAmount(v),
    );
