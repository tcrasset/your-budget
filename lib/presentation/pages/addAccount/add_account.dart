// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../../appstate.dart';
import '../../../models/account.dart';
import '../../../models/utils.dart';
import 'components/account_balance.dart';
import 'components/account_name.dart';
import 'components/account_row.dart';

class AddAccountPage extends StatefulWidget {
  final String title;

  const AddAccountPage({Key key, this.title}) : super(key: key);
  @override
  _AddAccountPageState createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  final _accountFormKey = GlobalKey<FormState>(); //FormCheck
  double accountBalance;
  String accountName;

  String handleAccountBalanceValidate(String amount) {
    if (amount.isEmpty) {
      return 'Please enter an account balance';
    } else if (!isNumeric(amount)) {
      return 'Insert a valid number';
    }
    return null;
  }

  void handleAccountBalanceSave(String balance) {
    accountBalance = double.parse(balance);
  }

  Future<void> handleAddAccount(BuildContext context) async {
    if (_accountFormKey.currentState.validate()) {
      _accountFormKey.currentState.save();
      final AppState appState = Provider.of<AppState>(context, listen: false);
      // If form is valid, add subcategory to the database and add it to the state
      appState.addAccount(accountName: accountName, balance: accountBalance);
      _accountFormKey.currentState.reset();
    }
  }

  final TextStyle _textBoxStyle = const TextStyle(fontSize: 25);

  final InputDecoration _textBoxDecoration = InputDecoration(
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add a new account"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Form(
                  key: _accountFormKey,
                  child: Column(
                    children: <Widget>[
                      AccountName(textStyle: _textBoxStyle, boxDecoration: _textBoxDecoration),
                      AccountBalance(textStyle: _textBoxStyle, boxDecoration: _textBoxDecoration),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: RaisedButton(
                          key: const Key('addAccountButton'),
                          color: Theme.of(context).accentColor,
                          onPressed: () => handleAddAccount(context),
                          child: const Text(
                            'Add account',
                          ),
                        ),
                      ),
                    ],
                  )),
              Consumer<AppState>(builder: (_, appState, __) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(children: _buildAccountRows(appState)),
                );
              })
            ],
          ),
        ));
  }

  List<Widget> _buildAccountRows(AppState appState) {
    final List<Widget> rows = [];
    for (final Account account in appState.accounts) {
      final row = AccountRow(
        account: account,
      );
      rows.add(row);
    }

    return rows;
  }
}
