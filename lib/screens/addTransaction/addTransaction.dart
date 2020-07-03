import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/components/overlayNotifications.dart';

import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/models/utils.dart';
import 'package:mybudget/screens/addTransaction/selectValue.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/screens/addTransaction/components/rowContainer.dart';
import 'package:provider/provider.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageController createState() => _AddTransactionPageController();
}

class _AddTransactionPageController extends State<AddTransactionPage> {
  MoneyMaskedTextController _amountController;

  final TextStyle _amountTextStyle = new TextStyle(color: Colors.black, fontSize: 32.0);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _memoController = new TextEditingController();
  final ScrollController _scrollController = new ScrollController();

  double _amount;
  String _payeeFieldName;
  String _accountFieldName;
  String _subcategoryFieldName;
  String _dateFieldName;

  String _defaultPayeeFieldName;
  String _defaultAccountFieldName;
  String _defaultSubcategoryFieldName;

  Payee _payee;
  Account _account;
  SubCategory _subcategory;
  DateTime _date;

  // Will hold async data when FutureBuilder returns
  List<Payee> payees;
  List<Account> accounts;
  List<SubCategory> subcategories;

  AppState appState;

  @override
  void initState() {
    super.initState();

    appState = Provider.of<AppState>(context, listen: false);
    payees = appState.payees;
    accounts = appState.accounts;
    subcategories = appState.dbSubcategories; //TODO: Create List of subcategories in appState

    _defaultPayeeFieldName = "Select payee";
    _defaultAccountFieldName = "Select account";
    _defaultSubcategoryFieldName = "Select subcategory";
    _payee = null;
    _account = null;
    _subcategory = null;
    _date = DateTime.now();
    _payeeFieldName = _defaultPayeeFieldName;
    _accountFieldName = _defaultAccountFieldName;
    _subcategoryFieldName = _defaultSubcategoryFieldName;
    _dateFieldName = getDateString(_date);
    _amountController = new MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');
  }

  void resetToDefaultTransaction() {
    setState(() {
      _payee = null;
      _account = null;
      _subcategory = null;
      _date = DateTime.now();
      _payeeFieldName = _defaultPayeeFieldName;
      _accountFieldName = _defaultAccountFieldName;
      _subcategoryFieldName = _defaultSubcategoryFieldName;
      _dateFieldName = getDateString(_date);
      _amountController.updateValue(0);
      _memoController.clear();
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
          builder: (context) => SelectValuePage(title: "Payees", listEntries: payees)),
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
          builder: (context) => SelectValuePage(title: "Accounts", listEntries: accounts)),
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
              SelectValuePage(title: "Subcategories", listEntries: subcategories)),
    ).then((returnElement) {
      setState(() {
        _subcategory = returnElement;
        _subcategoryFieldName = returnElement.name;
      });
    });
  }

  Future<Null> handleOnTapDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: getDateYMD(_date),
        firstDate: DateTime(2010, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _date)
      setState(() {
        _date = picked;
        _dateFieldName = getDateString(picked);
      });
  }

  void _addMoneyTransaction() async {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      if (_payee != null && _account != null && _subcategory != null) {
        print("Form validated");
        print("Amount : $_amount");
        print("Payee : $_payeeFieldName");
        print("Account : $_accountFieldName");
        print("Subcategory : $_subcategoryFieldName");
        print("Date: $_dateFieldName");
        print("Memo : ${_memoController.text}");
        //TODO: Fix amount value not being saved (only 0.0 is saved)
        int moneyTransactionCount = await SQLQueryClass.moneyTransactionCount();

        MoneyTransaction moneyTransaction = new MoneyTransaction(moneyTransactionCount + 1,
            _subcategory.id, _payee.id, _account.id, _amount, _memoController.text, _date);

        SQLQueryClass.addMoneyTransaction(moneyTransaction);
        appState.addTransaction(moneyTransaction);

        resetToDefaultTransaction();

        showOverlayNotification(context, "Transaction added");
      } else {
        print("One of the fields does not contain a valid type");
      }
    }
  }

  handleAmountOnSave() {
    _amount = _amountController.numberValue;
  }

  handleAmountValidate(String value) {
    if (_amountController.numberValue <= 0) {
      return "Value must be different than 0";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) => _AddTransactionPageView(this);
}

class _AddTransactionPageView
    extends WidgetView<AddTransactionPage, _AddTransactionPageController> {
  _AddTransactionPageView(_AddTransactionPageController state) : super(state);

  final TextStyle defaultChildTextStyle =
      TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 16.0);

  final TextStyle selectedChildTextStyle = TextStyle(color: Colors.black, fontSize: 16.0);

  Widget _myBuildMethod() {
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
          validator: (value) => state.handleAmountValidate(value),
          onSaved: state.handleAmountOnSave(),
        ));

    //Populate the list of container with the number controllers and
    //the custom listTiles
    List<Widget> containerList = [
      amountInputContainer,
      GestureDetector(
          // Payees gesture detectory leading to 'Payees' SelectValuePage
          onTap: () => state.handleOnTapPayee(),
          child: rowContainer(
              "Payee",
              Text(state._payeeFieldName,
                  style: (state._payeeFieldName == state._defaultPayeeFieldName)
                      ? defaultChildTextStyle
                      : selectedChildTextStyle))),
      GestureDetector(
          // Accounts gesture detectory leading to 'Accounts' SelectValuePage
          onTap: () => state.handleOnTapAccount(),
          child: rowContainer(
              "Account",
              Text(state._accountFieldName,
                  style: (state._accountFieldName == state._defaultAccountFieldName)
                      ? defaultChildTextStyle
                      : selectedChildTextStyle))),
      GestureDetector(
          // Subcategory gesture detectory leading to 'Categories' SelectValuePage
          onTap: () => state.handleOnTapCategory(),
          child: rowContainer(
              "Category",
              Text(state._subcategoryFieldName,
                  style: (state._subcategoryFieldName == state._defaultSubcategoryFieldName)
                      ? defaultChildTextStyle
                      : selectedChildTextStyle))),
      GestureDetector(
          // Date gesture detector
          onTap: () => state.handleOnTapDate(state.context),
          child: rowContainer("Date", Text(state._dateFieldName, style: selectedChildTextStyle))),
      rowContainer(
        "Memo",
        TextField(
          decoration: new InputDecoration(hintText: "Add a memo"),
          controller: state._memoController,
        ),
      ),
      //TODO : Add Repeat Option
      //TODO : Add color option
      GestureDetector(
          // Date gesture detector
          onTap: () => {},
          child: rowContainer("Repeat", Text("Never", style: selectedChildTextStyle))),
      GestureDetector(
          // Date gesture detector
          onTap: () => {},
          child: rowContainer("Color", Text("None", style: selectedChildTextStyle))),
    ];

    // Build the layout (ListView, error container, Button)
    return SingleChildScrollView(
      child: Column(children: [
        Container(
            height: 400,
            child: Scrollbar(
              isAlwaysShown: true,
              controller: state._scrollController,
              child: ListView.separated(
                  controller: state._scrollController,
                  shrinkWrap: false,
                  addAutomaticKeepAlives: true,
                  itemCount: containerList.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(height: 1, color: Colors.black12),
                  itemBuilder: (context, index) {
                    return containerList[index];
                  }),
            )),
        //TODO : Error message

        Container(
          padding: EdgeInsets.all(5),
          child: Text("ERROR!", style: TextStyle(color: Colors.red)),
        ),
        FloatingActionButton(
          child: Text("Enter"),
          onPressed: () => state._addMoneyTransaction(),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New transaction"),
        ),
        body: Consumer<AppState>(builder: (context, appState, child) {
          if (appState.transactions.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Form(
              key: state._formKey,
              child: _myBuildMethod(),
            );
          }
        }));
  }
}
