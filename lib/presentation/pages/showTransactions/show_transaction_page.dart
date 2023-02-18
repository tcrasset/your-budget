// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:your_budget/application/core/budget_date_cubit.dart';
import 'package:your_budget/application/core/transaction_watcher_bloc/transaction_watcher_bloc.dart';
import 'package:your_budget/application/showTransactions/selected_account_cubit/selected_account_cubit.dart';
import 'package:your_budget/application/showTransactions/transaction_selector_bloc/transaction_selector_bloc.dart';
import 'package:your_budget/components/delete_dialog.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
// Project imports:
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/domain/transaction/transaction_repository.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/core/progress_overlay.dart';

import '../../../domain/account/account.dart';

// import '../modifyTransactions/modify_transactions.dart';

class ShowTransactionPage extends StatelessWidget {
  final String title;
  const ShowTransactionPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionSelectorBloc>(
          create: (context) => TransactionSelectorBloc(
            transactionRepository: context.read<TransactionRepository>(),
          ),
        ),
        BlocProvider<TransactionWatcherBloc>(
          create: (context) => TransactionWatcherBloc(
            transactionRepository: context.read<TransactionRepository>(),
            accountRepository: GetIt.instance<IAccountProvider>(),
          )
            // Start the subscription to transactions of the currently selected account.
            ..add(
              TransactionWatcherEvent.watchTransactionsStarted(
                account: context.read<SelectedAccountCubit>().state,
              ),
            ),
        )
      ],
      child: TransactionScaffold(title: title),
    );
  }
}

class TransactionScaffold extends StatelessWidget {
  final String title;
  const TransactionScaffold({Key? key, required this.title}) : super(key: key);

  Future<void> handleDeleteTransactions(BuildContext context) async {
    // Delete selected transactions and get back to non-modifying screen
    final bloc = context.read<TransactionSelectorBloc>();
    final String? shouldDelete = await showDeleteDialog(context, 'Delete selected transactions?');

    if (shouldDelete == null) return;
    bloc.add(const TransactionSelectorEvent.deleteSelected());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TransactionWatcherBloc, TransactionWatcherState>(
          listener: (context, state) {
            // Show an error Snackbar if there is an error during Transaction fetching.
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
        ),
        BlocListener<SelectedAccountCubit, Account?>(
          // This listener will listen to selected accounts and, if the selected account
          // changes, e.g. when pressing the 'Next Account' button, or when adding
          // an account when there were None, this will trigger and re-subscribe to
          // the transactions stream of that selected account.
          listener: (context, state) {
            if (state == null) {
              context.read<SelectedAccountCubit>().selectNext();
            } else {
              context.read<TransactionWatcherBloc>().add(
                    TransactionWatcherEvent.watchTransactionsStarted(
                      account: state,
                    ),
                  );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: const Icon(Constants.ALLTRANSACTION_ICON),
          backgroundColor: Constants.PRIMARY_COLOR,
          actions: <Widget>[
            BlocBuilder<TransactionSelectorBloc, TransactionSelectorState>(
              builder: (context, state) {
                // Show or do not show trashcan depending on isModifying flag
                if (!state.isModifying) {
                  return Container();
                }
                return IconButton(
                  icon: Icon(
                    FontAwesomeIcons.trashCan,
                    color: state.selectedTransactions.isEmpty ? Colors.grey : Constants.RED_COLOR,
                  ),
                  onPressed: () =>
                      state.selectedTransactions.isEmpty ? null : handleDeleteTransactions(context),
                );
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.squareCheck),
              onPressed: () => context
                  .read<TransactionSelectorBloc>()
                  .add(const TransactionSelectorEvent.toggleModifying()),
            ),
          ],
        ),
        body: Stack(
          children: [
            OptionalTransactionList(),
            BlocBuilder<TransactionWatcherBloc, TransactionWatcherState>(
              builder: (context, state) {
                bool isLoading = state.maybeMap(
                  initial: (_) => true,
                  loading: (_) => true,
                  orElse: () => false,
                );
                return InProgressOverlay(
                  showOverlay: isLoading,
                  textDisplayed: "Loading",
                );
              },
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
      const AccountButtons(),
      const EmptyTransactionList(),
    ],
  );

  OptionalTransactionList();

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
                    const EmptyTransactionList()
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
    Key? key,
    required this.transactions,
  }) : super(key: key);

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
              return ListTile(
                key: Key(transaction.id.getOrCrash()),
                title: TransactionListTileTitle(transaction: transaction),
                subtitle: TransactionListTileSubtitle(transaction: transaction),
              );
            }
          },
        );
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
        Expanded(child: Text(transaction.giverName.getOrCrash())),
        Expanded(
          child: transaction.subcategory == null
              ? Text(transaction.receiverName.getOrCrash())
              : Text(transaction.subcategory!.name.getOrCrash()),
        )
      ],
    );
  }
}

class CheckboxTransactionListTile extends StatelessWidget {
  const CheckboxTransactionListTile({
    Key? key,
    required this.transaction,
    // required this.isSelected,
  }) : super(key: key);

  final MoneyTransaction transaction;
  // final bool isSelected;

  @override
  Widget build(BuildContext context) {
    // Only rebuild the Widget when the transaction is selected
    final isSelected = context.select<TransactionSelectorBloc, bool>(
      (bloc) => bloc.state.selectedTransactions.contains(transaction),
    );

    return CheckboxListTile(
      onChanged: (_) => context
          .read<TransactionSelectorBloc>()
          .add(TransactionSelectorEvent.toggleSelected(transaction)),
      value: isSelected,
      dense: true,
      selected: isSelected,
      enabled: transaction.type != MoneyTransactionType.initial,
      controlAffinity: ListTileControlAffinity.leading,
      title: TransactionListTileTitle(transaction: transaction),
      subtitle: TransactionListTileSubtitle(transaction: transaction),
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
        "No transactions logged for this account.",
        style: TextStyle(color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic),
      ),
    );
  }
}

class AccountButtons extends StatelessWidget {
  const AccountButtons({super.key});

  Future<void> handleButtonOnPressed({
    required BuildContext context,
    required bool increment,
  }) async {
    final cubit = context.read<SelectedAccountCubit>();
    if (increment) {
      await cubit.selectNext();
    } else {
      await cubit.selectPrevious();
    }
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
          BlocBuilder<SelectedAccountCubit, Account?>(
            // Rebuild and refetch the transactions if the selected account changes
            builder: (context, state) {
              final String accountName = state?.name.getOrCrash() ?? "No accounts";

              return Text(
                accountName,
                style: const TextStyle(fontSize: 20),
              );
            },
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
