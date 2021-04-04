// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/appState.dart';
import 'package:your_budget/components/widgetViewClasses.dart';
import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';

class AddAccountRoute extends StatefulWidget {
  final String title;

  const AddAccountRoute({Key key, this.title}) : super(key: key);
  @override
  _AddAccountRouteController createState() => _AddAccountRouteController();
}

class _AddAccountRouteController extends State<AddAccountRoute> {
  final _accountFormKey = GlobalKey<FormState>(); //FormCheck
  double accountBalance;
  String accountName;

  String handleAccountNameValidate(String name) {
    if (name.isEmpty) {
      return 'Please enter an account name';
    }
    return null;
  }

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

  void handleAccountNameSave(String name) {
    accountName = name;
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

  @override
  Widget build(BuildContext context) => _AddAccountRouteView(this);
}

class _AddAccountRouteView
    extends WidgetView<AddAccountRoute, _AddAccountRouteController> {
  final TextStyle _textBoxStyle = const TextStyle(fontSize: 25);
  final TextStyle _accountNameStyle =
      const TextStyle(fontSize: 25, fontStyle: FontStyle.italic);
  final TextStyle _positiveAmountTextStyle =
      const TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
  final TextStyle _negativeAmountTextStyle =
      const TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);

  final InputDecoration _textBoxDecoration = InputDecoration(
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  );

  _AddAccountRouteView(_AddAccountRouteController state) : super(state);

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
                  key: state._accountFormKey,
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Add an account",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        // height: 70,
                        child: Center(
                          child: TextFormField(
                            key: const Key('accountNameTextField'),
                            decoration: _textBoxDecoration,
                            style: _textBoxStyle,
                            textAlign: TextAlign.center,
                            validator: state.handleAccountNameValidate,
                            onSaved: state.handleAccountNameSave,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
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
                              decoration: _textBoxDecoration,
                              style: _textBoxStyle,
                              textAlign: TextAlign.center,
                              validator: state.handleAccountBalanceValidate,
                              onSaved: state.handleAccountBalanceSave,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[0-9-.]"))
                              ],
                              textInputAction: TextInputAction.done,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: RaisedButton(
                          key: const Key('addAccountButton'),
                          color: Theme.of(context).accentColor,
                          onPressed: () => state.handleAddAccount(context),
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
      final row = Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Text(
                  account.name,
                  style: _accountNameStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                account.balance.toStringAsFixed(2) + " €",
                style: account.balance.isNegative
                    ? _negativeAmountTextStyle
                    : _positiveAmountTextStyle,
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
              )
            ]),
      );
      rows.add(row);
    }

    return rows;
  }
}
