import 'package:flutter/material.dart';

import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/screens/showTransactions/components/transaction.dart';

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
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: new AppBar(
          title: Text(widget.title),
        ),
        body: new Column(children: [
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Expanded(
              child: FutureBuilder(
                  // Perform async operations before displaying the interface
                  future: Future.wait([
                    SQLQueryClass.getMoneyTransactions(),
                    SQLQueryClass.getPayees(),
                    SQLQueryClass.getAccounts(),
                    SQLQueryClass.getSubCategories(),
                  ]),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return new Container();
                        break;
                      case ConnectionState.waiting:
                        return new Center(child: new CircularProgressIndicator());
                        break;
                      case ConnectionState.active:
                        return new Container();
                        break;
                      case ConnectionState.done:
                        {
                          if (snapshot.hasError) {
                            return new Text('${snapshot.error}',
                                style: TextStyle(color: Colors.red));
                          } else {
                            state.moneyTransactionList = snapshot.data[0];
                            print(state.moneyTransactionList);
                            return new Container(
                                child: new ListView.separated(
                              shrinkWrap: true,
                              itemCount: state.moneyTransactionList.length,
                              separatorBuilder: (BuildContext context, int index) =>
                                  Divider(height: 1, color: Colors.black12),
                              itemBuilder: (BuildContext context, int index) {
                                return transaction(snapshot, index);
                              },
                            ));
                          }
                        }
                        break;
                      default:
                        return new Container();
                        break;
                    }
                  }))
        ]));
  }
}
