import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mybudget/categories.dart';
import 'package:mybudget/database_creator.dart';
import 'package:mybudget/entries.dart';
import 'package:mybudget/searchPage.dart';

class TransactionPage extends StatefulWidget {
  @override
  State createState() => new TransactionPageState();
}

class TransactionPageState extends State<TransactionPage> {
  MoneyMaskedTextController _amountController;

  final TextStyle _amountTextStyle =
      new TextStyle(color: Colors.black, fontSize: 32.0);

  final _formKey = GlobalKey<FormState>();

  double _amount;
  String _payeeName;
  String _accountName;
  String _subcategoryName;
  DateTime _date;
  String _errorMessage;

  // Will hold async data when FutureBuilder returns
  List<Payee> payees;
  List<Account> accounts;
  List<SubCategory> subcategories;
  List<String> payee_names;
  List<String> account_names;
  List<String> subcategory_names;

  @override
  void initState() {
    super.initState();
    _errorMessage = "";
    _amountController = new MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _addMoneyTransaction() async {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      print("Form validated");
      print(this._amount);
      print(this._payeeName);
      print(this._accountName);
      print(this._subcategoryName);
      int moneyTransactionCount = 0; //await SQLQueries.moneyTransactionCount();
      int payeeID = subcategories
          .singleWhere((payee) => payee.name.toLowerCase() == this._payeeName)
          .id;
      int accountID = subcategories
          .singleWhere(
              (account) => account.name.toLowerCase() == this._accountName)
          .id;
      int subcategoryID = subcategories
          .singleWhere(
              (subcat) => subcat.name.toLowerCase() == this._subcategoryName)
          .id;

      print("Form submitted");
      MoneyTransaction moneyTransaction = new MoneyTransaction(
          moneyTransactionCount + 1,
          subcategoryID,
          payeeID,
          accountID,
          this._amount,
          "",
          DateTime.now());

      // SQLQueries.addMoneyTransaction(moneyTransaction);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: new AppBar(
          title: new Text("New transaction"),
        ),
        body: Form(
            key: _formKey,
            child: FutureBuilder(
                // Perform async operations before displaying the interface
                future: Future.wait([
                  SQLQueries.getPayees(),
                  SQLQueries.getAccounts(),
                  SQLQueries.getSubCategories(),
                ]),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return new Container();
                    case ConnectionState.waiting:
                      return new Center(child: new CircularProgressIndicator());
                    case ConnectionState.active:
                      return new Container();
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return new Text('${snapshot.error}',
                            style: TextStyle(color: Colors.red));
                      } else {
                        // Assign the async data to the respective variables

                        payees = snapshot.data[0];
                        accounts = snapshot.data[1];
                        subcategories = snapshot.data[2];

                        Container amountInputContainer = Container(
                            height: 50,
                            alignment: Alignment.centerRight,
                            padding: new EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            child: TextFormField(
                              decoration: new InputDecoration.collapsed(
                                hintText: "",
                              ),
                              keyboardType: TextInputType.number,
                              controller: _amountController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(12)
                              ],
                              textInputAction: TextInputAction.done,
                              textAlign: TextAlign.right,
                              style: _amountTextStyle,
                              validator: (value) {
                                if (_amountController.numberValue <= 0) {
                                  return "Value must be different than 0";
                                }
                                return null;
                              }, // Always validate because no access to controller value
                              onSaved: (value) =>
                                  this._amount = _amountController.numberValue,
                            ));

                        List<Widget> containerList = [
                          amountInputContainer,
                          CustomTile(
                              initialValue: "Select payee",
                              containerName: "Payee",
                              entries: payees,
                              searchPageTitle: "Payees"),
                          CustomTile(
                              initialValue: "Select account",
                              containerName: "Account",
                              entries: accounts,
                              searchPageTitle: "Accounts"),
                          CustomTile(
                              initialValue: "Select category",
                              containerName: "Category",
                              entries: subcategories,
                              searchPageTitle: "Categories")
                          // TransactionContainer(containerName:'Date', defaultValue: 'Select date'),
                          // TransactionContainer(containerName:'Repeat', defaultValue: 'Never'),
                          // TransactionContainer(containerName:'Memo', defaultValue: 'Optional'),
                          // TransactionContainer(containerName:'Color', defaultValue: 'Default'),
                        ];

                        // Build the layout (ListView, error container, Button)
                        return Column(children: [
                          Container(
                              height: 350,
                              child: ListView.separated(
                                  shrinkWrap: false,
                                  addAutomaticKeepAlives: true,
                                  itemCount: containerList.length,
                                  separatorBuilder: (BuildContext context,
                                          int index) =>
                                      Divider(height: 1, color: Colors.black12),
                                  itemBuilder: (context, index) {
                                    return containerList[index];
                                  })),
                          // Container(
                          //   padding: EdgeInsets.all(5),
                          //   child: Text(_errorMessage, style: TextStyle(color:Colors.red)),
                          // ),
                          FloatingActionButton(
                            child: Text("Enter"),
                            onPressed: _addMoneyTransaction,
                          )
                        ]);
                      }
                  }
                })));
  }
}

class CustomTile extends StatefulWidget {
  String initialValue;
  String containerName;
  List entries;
  String searchPageTitle;

  CustomTile({
    this.containerName,
    this.initialValue,
    this.searchPageTitle,
    this.entries,
  });



  @override
  State<StatefulWidget> createState() => new CustomTileSTate();
}

class CustomTileSTate extends State<CustomTile> {

  @override
  void didUpdateWidget(CustomTile oldTile){
    super.didUpdateWidget(oldTile);
    print("THE WIDGET CHANGED: " + widget.containerName);
  }

  @override
  Widget build(BuildContext context) {
    String _tileText = widget.initialValue;

    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchPage(
                  title: widget.searchPageTitle, listEntries: widget.entries)),
        ).then((returnValue) {
          print("MOUNTED YES OR NO :3" + this.mounted.toString());
          if (this.mounted) {
            setState(() {
              _tileText = returnValue.name;
            });
          }
        });
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Text(widget.containerName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                ),
                Expanded(
                  child: Text(_tileText),
                ),
              ],
            ),
          ])),
    );
  }
}
