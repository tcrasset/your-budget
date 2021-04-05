// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../../appstate.dart';
import '../../../components/widgetViewClasses.dart';
import '../../../models/account.dart';
import '../../../models/constants.dart';
import '../../../models/money_transaction.dart';
import '../core/transactions/transaction_list.dart';
import '../modifyTransactions/modify_transactions.dart';

class ShowTransactionPage extends StatefulWidget {
  final String title;

  const ShowTransactionPage({Key key, this.title}) : super(key: key);

  @override
  _ShowTransactionPageController createState() =>
      _ShowTransactionPageController();
}

class _ShowTransactionPageController extends State<ShowTransactionPage> {
  String filter;
  Future<Account> accountFuture;
  bool isEditable;
  List<MoneyTransaction> moneyTransactionList;

  @override
  void initState() {
    final AppState appState = Provider.of<AppState>(context, listen: false);
    accountFuture = appState.mostRecentAccount;
    isEditable = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _ShowTransactionPageView(this);

  void handleModifyTransactions() async {
    final Account account = await accountFuture;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ModifyTransactions(account)));
  }
}

class _ShowTransactionPageView
    extends WidgetView<ShowTransactionPage, _ShowTransactionPageController> {
  const _ShowTransactionPageView(_ShowTransactionPageController state)
      : super(state);

  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context, listen: true);

    final Widget emptyAccountList = Column(
      children: [
        const AccountButtons(accountText: "No accounts."),
        const EmptyTransactionList(),
      ],
    );

    if (appState.accounts.isEmpty) return emptyAccountList;

    return FutureBuilder<Account>(
      future: state.accountFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final Account account = snapshot.data;
          return Scaffold(
            appBar: getAppbar(widget.title, state.handleModifyTransactions),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AccountButtons(accountText: account.name),
                AtLeastOneTransactionList(
                  account: account,
                  isEditable: state.isEditable,
                ),
              ],
            ),
          );
        } else {
          return emptyAccountList;
        }
      },
    );
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
