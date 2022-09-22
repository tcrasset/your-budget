// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:your_budget/application/showTransactions/transaction_watcher_bloc/transaction_watcher_bloc.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
// Project imports:
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/core/progress_overlay.dart';
import 'package:your_budget/presentation/pages/modifyTransactions/modify_transactions.dart';

// import '../modifyTransactions/modify_transactions.dart';

class ShowTransactionPage extends StatelessWidget {
  final String title;
  const ShowTransactionPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionWatcherBloc>(
          create: (context) => TransactionWatcherBloc(
            transactionRepository: GetIt.instance<ITransactionRepository>(),
            accountRepository: GetIt.instance<IAccountRepository>(),
          )..add(const TransactionWatcherEvent.watchTransactionsStarted()),
        ),
      ],
      child: TransactionScaffold(title: title),
    );
  }
}

class TransactionScaffold extends HookWidget {
  final String title;
  const TransactionScaffold({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use ValueNotifier to change the Widget from a ListTile to a CheckboxListTile
    ValueNotifier<bool> isModifying = useState(false);
    bool? isLoading;
    return MultiBlocListener(
      listeners: [
        BlocListener<TransactionWatcherBloc, TransactionWatcherState>(
          listener: (context, state) {
            isLoading = state.maybeMap(
              initial: (_) => true,
              loading: (_) => true,
              orElse: () => false,
            );

            final String? errorMessage = state.maybeMap(
              orElse: () => null,
              loadFailure: (_) => "Failed to load the transactions. Please contact support.",
            );

            if (errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(errorMessage), duration: const Duration(seconds: 1)),
              );
            }
          },
        )
      ],
      child: Scaffold(
        appBar: getAppbar(
          title,
          isModifying.value,
          () => {isModifying.value = !isModifying.value},
          () {
            // Delete selected transactions and get back to non-modifying screen
            context.read<TransactionWatcherBloc>().add(
                  const TransactionWatcherEvent.deleteSelectedTransactions(),
                );
            isModifying.value = !isModifying.value;
          },
        ),
        body: Stack(
          children: [
            OptionalTransactionList(
              isModifying: isModifying.value,
            ),
            InProgressOverlay(
              showOverlay: isLoading ?? false,
              textDisplayed: "Loading",
            )
          ],
        ),
      ),
    );
  }
}

class OptionalTransactionList extends StatelessWidget {
  final Widget emptyAccountList = Column(
    children: [
      const AccountButtons(accountText: "No accounts."),
      const EmptyTransactionList(),
    ],
  );

  final bool isModifying;
  OptionalTransactionList({required this.isModifying});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionWatcherBloc, TransactionWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          loadSuccess: (newState) {
            final transactions = newState.transactions;
            final String accountName =
                transactions.isNotEmpty ? transactions[0].account.name.getOrCrash() : "No accounts";
            return SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AccountButtons(
                    accountText: accountName,
                  ),
                  Expanded(
                      child: TransactionListView(
                          transactions: transactions, isModifying: isModifying)),
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

class TransactionListView extends StatelessWidget {
  const TransactionListView({
    Key? key,
    required this.transactions,
    required this.isModifying,
  }) : super(key: key);

  final bool isModifying;
  final List<MoneyTransaction> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: transactions.length,
      itemBuilder: (BuildContext context, int index) {
        final transaction = transactions[index];
        if (isModifying) {
          return CheckboxTransactionListTile(transaction: transaction);
        } else {
          return ListTile(
            title: TransactionListTileTitle(transaction: transaction),
            subtitle: TransactionListTileSubtitle(transaction: transaction),
          );
        }
      },
    );
  }
}

class TransactionListTileTitle extends StatelessWidget {
  const TransactionListTileTitle({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final MoneyTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(transaction.memo.getOrCrash())),
        Expanded(child: Text(transaction.payee.name.getOrCrash())),
        Expanded(child: Text(transaction.subcategory.name.getOrCrash())),
      ],
    );
  }
}

class CheckboxTransactionListTile extends HookWidget {
  const CheckboxTransactionListTile({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final MoneyTransaction transaction;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isSelected = useState(false);
    return CheckboxListTile(
      onChanged: (_) => _onChanged(context, isSelected),
      value: isSelected.value,
      dense: true,
      selected: isSelected.value,
      controlAffinity: ListTileControlAffinity.leading,
      title: TransactionListTileTitle(transaction: transaction),
      subtitle: TransactionListTileSubtitle(transaction: transaction),
    );
  }

  void _onChanged(BuildContext context, ValueNotifier<bool> isSelected) {
    isSelected.value = !isSelected.value;
    context.read<TransactionWatcherBloc>().add(
          TransactionWatcherEvent.selectTransaction(id: transaction.id.getOrCrash()),
        );
  }
}

class TransactionListTileSubtitle extends StatelessWidget {
  const TransactionListTileSubtitle({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final MoneyTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${transaction.amount.getOrCrash()} €'),
        Text(transaction.date.toLocal().toString()),
      ],
    );
  }
}

class EmptyTransactionList extends StatelessWidget {
  const EmptyTransactionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No transactions logged. Please choose an account.",
        style: TextStyle(color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic),
      ),
    );
  }
}

AppBar getAppbar(String title, bool isModifying, Function() handleModifyTransactions,
    Function() handleDeleteTransactions) {
  return AppBar(
    title: Text(title),
    leading: const Icon(Constants.ALLTRANSACTION_ICON),
    backgroundColor: Constants.PRIMARY_COLOR,
    actions: <Widget>[
      if (isModifying == true)
        IconButton(
          icon: const Icon(FontAwesomeIcons.trashCan, color: Constants.RED_COLOR),
          onPressed: handleDeleteTransactions,
        ),
      IconButton(
        icon: const Icon(FontAwesomeIcons.checkSquare),
        onPressed: handleModifyTransactions,
      ),
    ],
  );
}

class AccountButtons extends StatelessWidget {
  final String accountText;

  const AccountButtons({Key? key, required this.accountText}) : super(key: key);

  Future<void> handleButtonOnPressed({
    required BuildContext context,
    required bool increment,
  }) async {
    context.read<TransactionWatcherBloc>().add(
          TransactionWatcherEvent.cycleAccount(increment: increment),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => handleButtonOnPressed(context: context, increment: false),
          ),
          Text(
            accountText,
            style: const TextStyle(fontSize: 20),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => handleButtonOnPressed(context: context, increment: true),
          )
        ],
      ),
    );
  }
}
