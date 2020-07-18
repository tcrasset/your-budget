import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/models/entries.dart';
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
  _AddAccountRouteView(_AddAccountRouteController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add a new account"),
        ),
        body: Column(
          children: <Widget>[
            Form(
                key: state._catFormKey,
                child: Column(
                  children: <Widget>[
                    Text("Add an account"),
                    TextFormField(
                      validator: state.handleAccountNameValidate,
                      onSaved: (name) => state.accountName = name,
                      textInputAction: TextInputAction.next,
                    ),
                    Text("with starting balance of"),
                    TextFormField(
                      validator: state.handleAccountBalanceValidate,
                      onSaved: (balance) => state.accountBalance = double.parse(balance),
                      keyboardType: TextInputType.number,
                      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.done,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () => state.handleAddAccount(context),
                        child: Text('Add account'),
                      ),
                    ),
                  ],
                )),
            Consumer<AppState>(builder: (_, appState, __) {
              return Column(children: _buildAccountRows(appState));
            })
          ],
        ));
  }

  List<Widget> _buildAccountRows(AppState appState) {
    List<Widget> rows = [];
    for (final Account account in appState.accounts) {
      var row = Container(
        height: 30,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[Text(account.name), Text(account.balance.toString())]),
      );
      rows.add(row);
    }

    return rows;
  }
}
