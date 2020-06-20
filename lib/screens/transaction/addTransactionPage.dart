import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/screens/transaction/addTransactionSearchPage.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/screens/transaction/components/rowContainer.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageController createState() => _AddTransactionPageController();
}

class _AddTransactionPageController extends State<AddTransactionPage> {
  MoneyMaskedTextController _amountController;

  final TextStyle _amountTextStyle = new TextStyle(color: Colors.black, fontSize: 32.0);

  final _formKey = GlobalKey<FormState>();

  TextEditingController memo_controller = new TextEditingController();

  double _amount;
  String _payeeFieldName;
  String _accountFieldName;
  String _subcategoryFieldName;
  String _dateFieldName;

  Payee _payee;
  Account _account;
  SubCategory _subcategory;
  DateTime _date;

  // Will hold async data when FutureBuilder returns
  List<Payee> payees;
  List<Account> accounts;
  List<SubCategory> subcategories;

  bool _visibleAlertDialog = true;

  @override
  void initState() {
    super.initState();
    _payee = null;
    _account = null;
    _subcategory = null;
    _payeeFieldName = "Select payee";
    _accountFieldName = "Select acount";
    _subcategoryFieldName = "Select subcategory";
    _amountController = new MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');
  }

  void resetToDefaultTransaction() {
    setState(() {
      _payee = null;
      _account = null;
      _subcategory = null;
      _date = DateTime.now();
      _payeeFieldName = "Select payee";
      _accountFieldName = "Select acount";
      _subcategoryFieldName = "Select subcategory";
      _amountController.updateValue(0);
      _dateFieldName = DateTime.now().toString();
      memo_controller.clear();
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  handleOnTapPayee() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddTransactionSearchPage(title: "Payees", listEntries: payees)),
    ).then((returnElement) {
      setState(() {
        _payee = returnElement;
        _payeeFieldName = returnElement.name;
      });
    });
  }

  handleOnTapAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddTransactionSearchPage(title: "Accounts", listEntries: accounts)),
    ).then((returnElement) {
      setState(() {
        _account = returnElement;
        _accountFieldName = returnElement.name;
      });
    });
  }

  handleOnTapCategory() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              AddTransactionSearchPage(title: "Categories", listEntries: subcategories)),
    ).then((returnElement) {
      setState(() {
        _subcategory = returnElement;
        _subcategoryFieldName = returnElement.name;
      });
    });
  }

  handleOnTapDate() {
    setState(() {
      _date = DateTime.now();
      _dateFieldName = DateTime.now().toString();
    });
  }

  void _addMoneyTransaction() async {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      if (_payee != null && _account != null && _subcategory != null) {
        print("Form validated");
        print("Amount : ${this._amount}");
        print("Payee : ${this._payeeFieldName}");
        print("Account : ${this._accountFieldName}");
        print("Subcategory : ${this._subcategoryFieldName}");
        print("Memo : ${memo_controller.text}");

        int moneyTransactionCount = await SQLQueryClass.moneyTransactionCount();

        MoneyTransaction moneyTransaction = new MoneyTransaction(
            moneyTransactionCount + 1,
            _subcategory.id,
            _payee.id,
            _account.id,
            this._amount,
            memo_controller.text,
            DateTime.now());

        SQLQueryClass.addMoneyTransaction(moneyTransaction);
        resetToDefaultTransaction();

        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              //TODO : Create own dialog by modyfing version of Dialog
              return AlertDialog(
                title: Text('Transaction added'),
              );
            });
      } else {
        print("One of the fields does not contain a valid type");
      }
    }
  }

  @override
  Widget build(BuildContext context) => _AddTransactionPageView(this);
}

class _AddTransactionPageView
    extends WidgetView<AddTransactionPage, _AddTransactionPageController> {
  _AddTransactionPageView(_AddTransactionPageController state) : super(state);

  // Container MemoRowContainer()

  Widget _myBuildMethod(AsyncSnapshot snapshot) {
    // Assign the async data to the respective variables
    state.payees = snapshot.data[0];
    state.accounts = snapshot.data[1];
    state.subcategories = snapshot.data[2];

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
          controller: state._amountController,
          inputFormatters: [LengthLimitingTextInputFormatter(12)],
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.right,
          style: state._amountTextStyle,
          validator: (value) {
            if (state._amountController.numberValue <= 0) {
              return "Value must be different than 0";
            }
            return null;
          }, // Always validate because no access to controller value
          onSaved: (value) => state._amount = state._amountController.numberValue,
        ));

    //Populate the list of container with the number controllers and
    //the custom listTiles
    List<Widget> containerList = [
      amountInputContainer,
      GestureDetector(
          // Payees gesture detectory leading to 'Payees' AddTransactionSearchPage
          onTap: () => state.handleOnTapPayee(),
          child: rowContainer("Payee", Text(state._payeeFieldName))),
      GestureDetector(
          // Accounts gesture detectory leading to 'Accounts' AddTransactionSearchPage
          onTap: () => state.handleOnTapAccount(),
          child: rowContainer("Account", Text(state._accountFieldName))),
      GestureDetector(
          // Subcategory gesture detectory leading to 'Categories' AddTransactionSearchPage
          onTap: () => state.handleOnTapCategory(),
          child: rowContainer("Category", Text(state._subcategoryFieldName))),
      GestureDetector(
          // Date gesture detector
          onTap: () => state.handleOnTapDate(),
          child: rowContainer("Date", Text(DateTime.now().toString()))),
      rowContainer(
          "Memo",
          TextField(
            decoration: new InputDecoration(hintText: "Add a memo"),
            controller: state.memo_controller,
          )),
      //TODO : Add Repeat Option
      //TODO : Add color option
      // TransactionContainer(containerName:'Repeat', defaultValue: 'Never'),
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
      //TODO : Error message

      // Container(
      //   padding: EdgeInsets.all(5),
      //   child: Text(_errorMessage, style: TextStyle(color:Colors.red)),
      // ),
      FloatingActionButton(
        child: Text("Enter"),
        onPressed: () => state._addMoneyTransaction(),
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
            key: state._formKey,
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
                      break;
                    case ConnectionState.waiting:
                      return new Center(child: new CircularProgressIndicator());
                      break;
                    case ConnectionState.active:
                      return new Container();
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return new Text('${snapshot.error}', style: TextStyle(color: Colors.red));
                      } else {
                        return _myBuildMethod(snapshot);
                      }
                      break;
                    default:
                      return new Container();
                      break;
                  }
                })));
  }
}
