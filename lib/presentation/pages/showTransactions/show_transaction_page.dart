// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/application/showTransactions/transaction_watcher_bloc/transaction_watcher_bloc.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import 'package:your_budget/presentation/pages/core/progress_overlay.dart';
import '../../../appstate.dart';
import '../../../models/account.dart';
import '../../../models/constants.dart';
import '../../../models/money_transaction.dart';
import '../core/transactions/transaction_list.dart';
import '../modifyTransactions/modify_transactions.dart';

class ShowTransactionPage extends StatelessWidget {
  final String title;
  const ShowTransactionPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<TransactionWatcherBloc>(
        create: (context) => TransactionWatcherBloc(
            transactionRepository: GetIt.instance<ITransactionRepository>())
          ..add(const TransactionWatcherEvent.watchTransactionsStarted()),
      ),
    ], child: TransactionScaffold(title: title));
  }
}

class TransactionScaffold extends StatelessWidget {
  final String title;
  const TransactionScaffold({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoading;
    return MultiBlocListener(
        listeners: [
          BlocListener<TransactionWatcherBloc, TransactionWatcherState>(
            listener: (context, state) {
              isLoading = state.maybeMap(
                initial: (_) => true,
                loading: (_) => true,
                orElse: () => false,
              );

              final String errorMessage = state.maybeMap(
                orElse: () => null,
                loadFailure: (_) =>
                    "Failed to load the transactions. Please contact support.",
              );

              if (errorMessage != null) {
                FlushbarHelper.createError(message: errorMessage).show(context);
              }
            },
          )
        ],
        child: Scaffold(
          appBar: getAppbar(title, () => null),
          body: Stack(
            children: [
              OptionalTransactionList(),
              InProgressOverlay(
                showOverlay: isLoading ?? false,
                textDisplayed: "Loading",
              )
            ],
          ),
        ));

    // return FutureBuilder<Account>(
    //   future: state.accountFuture,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       final Account account = snapshot.data;
    //       return Scaffold(
    //         appBar: getAppbar(widget.title, state.handleModifyTransactions),
    //         body: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             AccountButtons(accountText: account.name),
    //             AtLeastOneTransactionList(
    //               account: account,
    //               isEditable: state.isEditable,
    //             ),
    //           ],
    //         ),
    //       );
    //     } else {
    //       return emptyAccountList;
    //     }
    //   },
    // );
  }
}

class OptionalTransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget emptyAccountList = Column(
      children: [
        const AccountButtons(accountText: "No accounts."),
        const EmptyTransactionList(),
      ],
    );

    return BlocBuilder<TransactionWatcherBloc, TransactionWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          loadSuccess: (newState) {
            final transactions = newState.transactions;
            return SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AccountButtons(
                    accountText: "My account",
                  ),
                  Expanded(
                      child: TransactionListView(transactions: transactions)),
                ],
              ),
            );
          },
          orElse: () => const EmptyTransactionList(),
        );
      },
    );
  }
}

class TransactionListView extends StatelessWidget {
  const TransactionListView({
    Key key,
    @required this.transactions,
  }) : super(key: key);

  final List<MoneyTransaction> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Amount: ${transactions[index]} €'),
          );
        });
  }
}

class AtLeastOneTransactionList extends StatelessWidget {
  final bool isEditable;
  final Account account;

  const AtLeastOneTransactionList({
    Key key,
    @required this.account,
    @required this.isEditable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (_, appState, __) {
      return Expanded(child: TransactionList(account, appState, isEditable));
    });
  }
}

class EmptyTransactionList extends StatelessWidget {
  const EmptyTransactionList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No transactions logged. Please choose an account.",
        style: TextStyle(
            color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic),
      ),
    );
  }
}

AppBar getAppbar(String title, Function() handleModifyTransactions) {
  return AppBar(
      title: Text(title),
      leading: const Icon(Constants.ALLTRANSACTION_ICON),
      backgroundColor: Constants.PRIMARY_COLOR,
      actions: <Widget>[
        IconButton(
          icon: const Icon(FontAwesomeIcons.checkSquare),
          onPressed: handleModifyTransactions,
        ),
      ]);
}

class AccountButtons extends StatelessWidget {
  final String accountText;

  const AccountButtons({Key key, this.accountText}) : super(key: key);

  Future<void> handleButtonOnPressed(BuildContext context) async {
    final AppState appState = Provider.of<AppState>(context, listen: false);
    debugPrint((await appState.nextMostRecentAccount).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (_, appState, __) {
      return SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => handleButtonOnPressed(context)),
            Text(
              accountText,
              style: const TextStyle(fontSize: 20),
            ),
            IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => handleButtonOnPressed(context))
          ],
        ),
      );
    });
  }
}
