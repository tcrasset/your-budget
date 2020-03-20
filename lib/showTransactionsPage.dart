import 'package:flutter/material.dart';
import 'package:mybudget/entries.dart';

import 'package:mybudget/database_creator.dart';

class ShowTransactionPage extends StatefulWidget {
  String title;

  ShowTransactionPage({@required this.title});

  @override
  State createState() => new ShowTransactionPageState();
}

class ShowTransactionPageState extends State<ShowTransactionPage> {

  TextEditingController controller = new TextEditingController();
  String filter;

  List<MoneyTransaction> moneyTransactionList;

  Future<List<MoneyTransaction>> _getMoneyTransactions() async {
    return SQLQueryClass.getMoneyTransactions();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: new Column(        
        children: [
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Expanded(
            child : FutureBuilder(
              // Perform async operations before displaying the interface
              future: _getMoneyTransactions(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState){
                  case ConnectionState.none:
                    return new Container();
                  case ConnectionState.waiting:
                    return new Center(child: new CircularProgressIndicator());
                  case ConnectionState.active:
                    return new Container();
                  case ConnectionState.done:
                    if (snapshot.hasError){
                      return new Text('${snapshot.error}',
                          style: TextStyle(color: Colors.red));
                    } else {
                        moneyTransactionList = snapshot.data;
                        return new Container(
                          child: new ListView.separated(
                            shrinkWrap: true,
                            itemCount: moneyTransactionList.length,
                            separatorBuilder: (BuildContext context, int index) =>
                                Divider(height: 1, color: Colors.black12),
                            itemBuilder: (BuildContext context, int index) {
                              return new ListTile(
                                title: Text('${moneyTransactionList[index].amount}'),
                                onTap: () {
                                  // Navigator.pop(context, item);
                                }
                              );
                            },
                          )
                        );
                    }
                }
              }
            )
          )
        ]
      )
    ); // End return Scaffold
  }
}
