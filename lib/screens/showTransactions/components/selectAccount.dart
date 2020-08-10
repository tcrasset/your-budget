import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/constants.dart';
import 'package:mybudget/models/entries.dart';
import 'package:provider/provider.dart';

class SelectAccountPage extends StatelessWidget {
  const SelectAccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    List<Account> accounts = appState.accounts;

    void handleOnTap(int index) {
      print("Popping");
      Navigator.pop(context, accounts[index]);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Select account"),
          leading: Icon(Constants.ALLTRANSACTION_ICON),
          backgroundColor: Constants.PRIMARY_COLOR,
        ),
        body: ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => handleOnTap(index),
                child: ListTile(
                  title: Text('${accounts[index].name}'),
                ),
              );
            }));
  }
}
