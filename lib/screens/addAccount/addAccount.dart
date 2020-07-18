import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/models/utils.dart';
import 'package:provider/provider.dart';

class AddAccountRoute extends StatefulWidget {
  final String title;

  const AddAccountRoute({Key key, this.title}) : super(key: key);
  @override
  _AddAccountRouteController createState() => _AddAccountRouteController();
}

class _AddAccountRouteController extends State<AddAccountRoute> {
  final _catFormKey = GlobalKey<FormState>(); //FormCheck
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

  void handleAddAccount(BuildContext context) async {
    if (_catFormKey.currentState.validate()) {
      _catFormKey.currentState.save();
      AppState appState = Provider.of<AppState>(context, listen: false);
      // If form is valid, add subcategory to the database and add it to the state
      print(accountName);
      print(accountBalance);
      appState.AddAccount(accountName, accountBalance);
    }
  }

  @override
  Widget build(BuildContext context) => _AddAccountRouteView(this);
}

class _AddAccountRouteView extends WidgetView<AddAccountRoute, _AddAccountRouteController> {
  final TextStyle _textBoxStyle = TextStyle(fontSize: 25);
  final TextStyle _accountNameStyle = TextStyle(fontSize: 25, fontStyle: FontStyle.italic);
  final TextStyle _positiveAmountTextStyle = new TextStyle(color: Colors.green, fontSize: 32.0);
  final TextStyle _negativeAmountTextStyle = new TextStyle(color: Colors.red, fontSize: 32.0);

  InputDecoration _textBoxDecoration = InputDecoration(
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
                    key: state._catFormKey,
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
                          // color: Colors.blue,
                          child: Center(
                            child: TextFormField(
                              decoration: _textBoxDecoration,
                              style: _textBoxStyle,
                              textAlign: TextAlign.center,
                              validator: state.handleAccountNameValidate,
                              onSaved: (name) => state.accountName = name,
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
                                decoration: _textBoxDecoration,
                                style: _textBoxStyle,
                                textAlign: TextAlign.center,
                                validator: state.handleAccountBalanceValidate,
                                onSaved: (balance) => state.accountBalance = double.parse(balance),
                                keyboardType: TextInputType.number,
                                inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9-]"))],
                                textInputAction: TextInputAction.done,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: RaisedButton(
                            onPressed: () => state.handleAddAccount(context),
                            child: Text(
                              'Add account',
                            ),
                          ),
                        ),
                      ],
                    )),
                Consumer<AppState>(builder: (_, appState, __) {
                  return Column(children: _buildAccountRows(appState));
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
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
            Text(account.name, style: _accountNameStyle),
            Text("${account.balance.toString()} €",
                style: account.balance.isNegative
                    ? _negativeAmountTextStyle
                    : _positiveAmountTextStyle)
          ]),
        ),
      );
      rows.add(row);
    }

    return rows;
  }
}
