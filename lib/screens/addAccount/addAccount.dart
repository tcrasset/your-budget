import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/components/widgetViewClasses.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/utils.dart';
import 'package:provider/provider.dart';

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

  void handleAddAccount(BuildContext context) async {
    if (_accountFormKey.currentState.validate()) {
      _accountFormKey.currentState.save();
      AppState appState = Provider.of<AppState>(context, listen: false);
      // If form is valid, add subcategory to the database and add it to the state
      appState.addAccount(accountName, accountBalance);
      _accountFormKey.currentState.reset();
    }
  }

  @override
  Widget build(BuildContext context) => _AddAccountRouteView(this);
}

class _AddAccountRouteView
    extends WidgetView<AddAccountRoute, _AddAccountRouteController> {
  final TextStyle _textBoxStyle = TextStyle(fontSize: 25);
  final TextStyle _accountNameStyle =
      TextStyle(fontSize: 25, fontStyle: FontStyle.italic);
  final TextStyle _positiveAmountTextStyle =
      new TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
  final TextStyle _negativeAmountTextStyle =
      new TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);

  final InputDecoration _textBoxDecoration = InputDecoration(
    fillColor: Colors.white,
    border: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(20.0),
      borderSide: new BorderSide(),
    ),
  );

  _AddAccountRouteView(_AddAccountRouteController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add a new account"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Form(
                    key: state._accountFormKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Add an account",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        // SizedBox(
                        //   height: 8,
                        // ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          // height: 70,
                          child: Center(
                            child: TextFormField(
                              key: Key('accountNameTextField'),
                              decoration: _textBoxDecoration,
                              style: _textBoxStyle,
                              textAlign: TextAlign.center,
                              validator: state.handleAccountNameValidate,
                              onSaved: state.handleAccountNameSave,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "with a starting balance of",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: TextFormField(
                                key: Key('accountBalanceTextField'),
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
                            key: Key('addAccountButton'),
                            color: Theme.of(context).accentColor,
                            onPressed: () => state.handleAddAccount(context),
                            child: Text(
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
          ),
        ));
  }

  List<Widget> _buildAccountRows(AppState appState) {
    List<Widget> rows = [];
    for (final Account account in appState.accounts) {
      var row = Container(
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
              SizedBox(
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
