// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:your_budget/application/core/transaction_watcher_bloc/transaction_watcher_bloc.dart';
import 'package:your_budget/application/showTransactions/selected_account_cubit/selected_account_cubit.dart';
import 'package:your_budget/application/showTransactions/transaction_selector_bloc/transaction_selector_bloc.dart';
import 'package:your_budget/components/delete_dialog.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
// Project imports:
import 'package:your_budget/domain/transaction/transaction_repository.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/core/progress_overlay.dart';

import 'package:your_budget/presentation/pages/showTransactions/components/transaction_list.dart';

class ShowTransactionPage extends StatelessWidget {
  final String title;
  const ShowTransactionPage({super.key, required this.title});

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
  const TransactionScaffold({super.key, required this.title});

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
            TransactionList(),
            BlocBuilder<TransactionWatcherBloc, TransactionWatcherState>(
              builder: (context, state) {
                final bool isLoading = state.maybeMap(
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
