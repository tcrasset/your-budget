import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';

import 'package:mybudget/models/entries.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/screens/showTransactions/components/transaction.dart';
import 'package:provider/provider.dart';

class ShowTransactionPage extends StatefulWidget {
  final String title;

  const ShowTransactionPage({Key key, this.title}) : super(key: key);

  @override
  _ShowTransactionPageController createState() => _ShowTransactionPageController();
}

class _ShowTransactionPageController extends State<ShowTransactionPage> {
  TextEditingController controller = new TextEditingController();
  String filter;

  List<MoneyTransaction> moneyTransactionList;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _ShowTransactionPageView(this);
}

class _ShowTransactionPageView
    extends WidgetView<ShowTransactionPage, _ShowTransactionPageController> {
  _ShowTransactionPageView(_ShowTransactionPageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      if (appState.categories.isEmpty) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return _TransactionList();
      }
    });
  }
}

class _TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    return new Container(
        child: new ListView.separated(
      shrinkWrap: true,
      itemCount: appState.transactions.length,
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1, color: Colors.black12),
      itemBuilder: (BuildContext context, int index) {
        return transaction(appState.transactions[index], appState.categories);
      },
    ));
  }
}
