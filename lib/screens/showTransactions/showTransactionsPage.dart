import 'package:flutter/material.dart';

import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/models/utils.dart';

class ShowTransactionPage extends StatefulWidget {
  final String title;

  ShowTransactionPage({@required this.title});

  @override
  State createState() => new ShowTransactionPageState();
}

class ShowTransactionPageState extends State<ShowTransactionPage> {
  TextEditingController controller = new TextEditingController();
  String filter;

  List<MoneyTransaction> moneyTransactionList;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Container _buildTransactionContainer(AsyncSnapshot snapshot, int index) {
    MoneyTransaction moneyTransaction = snapshot.data[0][index];
    List<SubCategory> subcategories = snapshot.data[3];

    SubCategory subcategory = subcategories.singleWhere(
        (subcategory) => subcategory.id == moneyTransaction.subcatID,
        orElse: () => null);

    String subcategoryName;
    if (subcategory == null) {
      subcategoryName = "No subcategory";
    } else {
      subcategoryName = subcategory.name;
    }

    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "MyMemo",
                  textAlign: TextAlign.left,
                ),
              ),
              Text("${moneyTransaction.amount} €", textAlign: TextAlign.right),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                subcategoryName,
                textAlign: TextAlign.left,
              ),
              Expanded(
                  child: Text(getDateString(moneyTransaction.date), textAlign: TextAlign.right)),
            ],
          ),
        ]));
  }

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
                            moneyTransactionList = snapshot.data[0];
                            return new Container(
                                child: new ListView.separated(
                              shrinkWrap: true,
                              itemCount: moneyTransactionList.length,
                              separatorBuilder: (BuildContext context, int index) =>
                                  Divider(height: 1, color: Colors.black12),
                              itemBuilder: (BuildContext context, int index) {
                                return _buildTransactionContainer(snapshot, index);
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
        ])); // End return Scaffold
  }
}
