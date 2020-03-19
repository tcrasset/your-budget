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
    _payeeName = "Select payee";
    _accountName = "Select acount";
    _subcategoryName = "Select subcategory";
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
      print("Amount : ${this._amount}");
      print("Payee : ${this._payeeName}");
      print("Account : ${this._accountName}");
      print("Subcategory : ${this._subcategoryName}");

      int moneyTransactionCount = await SQLQueryClass.moneyTransactionCount();
      
      int payeeID = payees
          .singleWhere((payee) => payee.name == this._payeeName)
          .id;
      int accountID = accounts
          .singleWhere(
              (account) => account.name == this._accountName)
          .id;
      int subcategoryID = subcategories
          .singleWhere(
              (subcat) => subcat.name == this._subcategoryName)
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

      SQLQueryClass.addMoneyTransaction(moneyTransaction);

    }
  }

  void _handleTapPayees(bool newValue) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SearchPage(title: "Payees", listEntries: payees)),
    ).then((returnElement) {
      print(returnElement);
      setState(() {
        _payeeName = returnElement.name;
      });
    });
  }

  void _handleTapSubcategories(bool newValue) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SearchPage(
              title: "Subcategories", listEntries: ["Hello", "Gotcha"])),
    ).then((returnElement) {
      print(returnElement);
      setState(() {
        _subcategoryName = returnElement;
        print("VALUE IS :" + _subcategoryName);
      });
    });
  }

  void _handleTapAccounts(bool newValue) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SearchPage(title: "Accounts", listEntries: accounts)),
    ).then((returnElement) {
      print(returnElement);
      setState(() {
        _accountName = returnElement.name;
      });
    });
  }

  Container RowContainer(String name, String value) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Text(name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0)),
              ),
              Expanded(
                child: Text(value),
              ),
            ],
          ),
        ]));
  }

  Widget _myBuildMethod(AsyncSnapshot snapshot) {
    // Assign the async data to the respective variables
    payees = snapshot.data[0];
    accounts = snapshot.data[1];
    subcategories = snapshot.data[2];

    // Create number controller
    Container amountInputContainer = Container(
        height: 50,
        alignment: Alignment.centerRight,
        padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: TextFormField(
          decoration: new InputDecoration.collapsed(
            hintText: "",
          ),
          keyboardType: TextInputType.number,
          controller: _amountController,
          inputFormatters: [LengthLimitingTextInputFormatter(12)],
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.right,
          style: _amountTextStyle,
          validator: (value) {
            if (_amountController.numberValue <= 0) {
              return "Value must be different than 0";
            }
            return null;
          }, // Always validate because no access to controller value
          onSaved: (value) => this._amount = _amountController.numberValue,
        ));

    //Populate the list of container with the number controllers and
    //the custom listTiles
    List<Widget> containerList = [
      amountInputContainer, //CustomTile does not want to build my widgets??
      // CustomTile(
      //   objectValue: _payeeName,
      //   containerName: "Payee",
      //   onChanged: _handleTapPayees,
      // ),
      // CustomTile(
      //   objectValue: "Select account",
      //   containerName: "Account",
      //   onChanged: _handleTapAccounts,
      // ),
      // CustomTile(
      //   objectValue: "Select category",
      //   containerName: "Category",
      //   onChanged: _handleTapSubcategories,
      // ),
      GestureDetector(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchPage(
                        title: "Payees", listEntries: payees)),
              ).then((returnElement) {
                print("The return element is $returnElement");
                setState(() {
                  this._payeeName = returnElement.name;
                });
              }),
          child: RowContainer("Payee",_payeeName)),
      GestureDetector(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchPage(
                        title: "Accounts", listEntries: accounts)),
              ).then((returnElement) {
                print("The return element is $returnElement");
                setState(() {
                  this._accountName = returnElement.name;
                });
              }),
          child: RowContainer("Account",_accountName)),
      GestureDetector(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchPage(
                        title: "Categories", listEntries: subcategories)),
              ).then((returnElement) {
                print("The return element is $returnElement whose name is ${returnElement.name}");
                setState(() {
                  print("Updating this._subcategoryName with previous value ${this._subcategoryName} to ${returnElement.name}");
                  this._subcategoryName = returnElement.name;
                });
              }),
          child: RowContainer("Category",_subcategoryName)),
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
              separatorBuilder: (BuildContext context, int index) =>
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
                  SQLQueryClass.getPayees(),
                  SQLQueryClass.getAccounts(),
                  SQLQueryClass.getSubCategories(),
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
                        return _myBuildMethod(snapshot);
                      }
                  }
                })));
  }
}
