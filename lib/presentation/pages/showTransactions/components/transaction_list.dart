import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:your_budget/application/core/transaction_watcher_bloc/transaction_watcher_bloc.dart';
import 'package:your_budget/application/showTransactions/transaction_selector_bloc/transaction_selector_bloc.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/presentation/pages/showTransactions/components/account_buttons.dart';
import 'package:your_budget/presentation/pages/showTransactions/components/tiles.dart';
import 'package:your_budget/presentation/pages/showTransactions/show_transaction_page.dart';

class TransactionList extends StatelessWidget {
  final Widget emptyAccountList = Column(
    children: [
      const AccountButtons(),
    ],
  );

  TransactionList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionWatcherBloc, TransactionWatcherState>(
      // Build the whole TransactionList once we successfully load the transactions
      // from the database.
      builder: (context, state) {
        return state.maybeMap(
          loadSuccess: (newState) {
            final transactions = newState.transactions;
            return SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AccountButtons(),
                  if (transactions.isEmpty)
                    const Text(
                      "Add an account first!",
                      style:
                          TextStyle(color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic),
                    )
                  else
                    Expanded(
                      child: TransactionListView(
                        transactions: transactions,
                      ),
                    ),
                ],
              ),
            );
          },
          orElse: () => emptyAccountList,
        );
      },
    );
  }
}

class TransactionListView extends HookWidget {
  const TransactionListView({
    super.key,
    required this.transactions,
  });

  final List<MoneyTransaction> transactions;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionSelectorBloc, TransactionSelectorState>(
      // Rebuild all the tiles when we toggle the modifying button.
      buildWhen: (p, c) => p.isModifying != c.isModifying,
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: transactions.length,
          itemBuilder: (BuildContext context, int index) {
            final transaction = transactions[index];
            if (state.isModifying) {
              return CheckboxTransactionListTile(transaction: transaction);
            } else {
              return TransactionListTile(transaction: transaction);
            }
          },
        );
      },
    );
  }
}
