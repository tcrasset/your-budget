// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/constants.dart';

class SelectAccountPage extends StatelessWidget {
  const SelectAccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);
    final List<Account> accounts = appState.accounts.toList();

    void handleOnTap(int index) {
      Navigator.pop(context, accounts[index]);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Select account"),
          leading: const Icon(Constants.ALLTRANSACTION_ICON),
          backgroundColor: Constants.PRIMARY_COLOR,
        ),
        body: ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => handleOnTap(index),
                child: ListTile(
                  title: Text(accounts[index].name),
                ),
              );
            }));
  }
}
