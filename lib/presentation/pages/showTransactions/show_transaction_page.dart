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
import 'components/select_account.dart';
import 'components/transaction_list.dart';
import 'modify_transactions.dart';

class ShowTransactionPage extends StatefulWidget {
  final String title;

  const ShowTransactionPage({Key key, this.title}) : super(key: key);

  @override
  _ShowTransactionPageController createState() =>
      _ShowTransactionPageController();
}

class _ShowTransactionPageController extends State<ShowTransactionPage> {
  final TextEditingController controller = TextEditingController();
  String filter;
  Account account;
  bool isEditable;
  List<MoneyTransaction> moneyTransactionList;

  @override
  void initState() {
    final AppState appState = Provider.of<AppState>(context, listen: false);
    if (appState.accounts.isNotEmpty) {
      account = appState.accounts[0];
    }
    isEditable = false;
    super.initState();
  }

  void handleOnAccountChanged(Account newAccount) {
    setState(() {
      account = newAccount;
    });
  }

  Future<void> handlePopUpMenuButtonSelected(String selectedItem) async {
    if (selectedItem == "Select account") {
      final Account result = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SelectAccountPage()));

      if (result != null) handleOnAccountChanged(result);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _ShowTransactionPageView(this);

  void handleModifyTransactions() {
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
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          leading: const Icon(Constants.ALLTRANSACTION_ICON),
          backgroundColor: Constants.PRIMARY_COLOR,
          actions: <Widget>[
            IconButton(
              icon: const Icon(FontAwesomeIcons.checkSquare),
              onPressed: state.handleModifyTransactions,
            ),
            PopupMenuButton(
              onSelected: state.handlePopUpMenuButtonSelected,
              itemBuilder: (context) => [
                const PopupMenuItem<String>(
                  value: "Select account",
                  child: Text("Select account"),
                ),
              ],
            ),
          ]),
      body: Consumer<AppState>(builder: (context, appState, child) {
        if (state.account == null || appState.transactions.isEmpty) {
          return const Center(
            child: Text(
              "No transactions logged. Please choose an account.",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontStyle: FontStyle.italic),
            ),
          );
        } else {
          return Column(children: [
            Text(
              state.account.name,
              style: const TextStyle(fontSize: 20),
            ),
            Expanded(
                child:
                    TransactionList(state.account, appState, state.isEditable)),
          ]);
        }
      }),
    );
  }
}
