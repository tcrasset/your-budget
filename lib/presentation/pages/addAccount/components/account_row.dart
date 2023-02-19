// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_budget/application/core/account_watcher_bloc/account_watcher_bloc.dart';
import 'package:your_budget/application/showTransactions/selected_account_cubit/selected_account_cubit.dart';
import 'package:your_budget/components/delete_dialog.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/models/constants.dart';

class AccountRow extends StatelessWidget {
  const AccountRow({
    required this.account,
  });
  final Account account;

  Future<void> handleOnLongPress(BuildContext context, Account account) async {
    final bloc = context.read<AccountWatcherBloc>();
    final cubit = context.read<SelectedAccountCubit>();

    final String? shouldDelete = await showDeleteDialog(context, 'Delete account?');

    if (shouldDelete == null) return;
    //TODO: fix account deletion
    bloc.add(AccountWatcherEvent.deleteAccount(account));
    await cubit.selectNext();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle positiveAmountTextStyle =
        TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
    const TextStyle negativeAmountTextStyle = TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);
    const TextStyle accountNameStyle = TextStyle(fontSize: 25, fontStyle: FontStyle.italic);

    return GestureDetector(
      onLongPress: () => handleOnLongPress(context, account),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Text(
              account.name.getOrCrash(),
              style: accountNameStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "${account.balance.getOrCrash().toStringAsFixed(2)} €",
            style: account.balance.getOrCrash().isNegative
                ? negativeAmountTextStyle
                : positiveAmountTextStyle,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          )
        ],
      ),
    );
  }
}
