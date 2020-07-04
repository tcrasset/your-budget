import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:mybudget/appState.dart';
import 'package:mybudget/components/overlayNotifications.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/models/utils.dart';
import 'package:mybudget/screens/addTransaction/components/CurrencyInputFormatter.dart';
import 'package:mybudget/screens/addTransaction/selectValue.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/screens/addTransaction/components/rowContainer.dart';

import 'package:provider/provider.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageController createState() => _AddTransactionPageController();
}

class _AddTransactionPageController extends State<AddTransactionPage> {
  TextEditingController _amountController;
  final NumberFormat currencyFormatter =
      NumberFormat.currency(locale: 'de', decimalDigits: 2, symbol: '€');

  final TextStyle _positiveAmountTextStyle = new TextStyle(color: Colors.green, fontSize: 32.0);
  final TextStyle _negativeAmountTextStyle = new TextStyle(color: Colors.red, fontSize: 32.0);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _memoController = new TextEditingController();
  final ScrollController _scrollController = new ScrollController();

  /// Default names will have a different style than selected ones
  final String _defaultPayeeFieldName = "Select payee";
  final String _defaultAccountFieldName = "Select account";
  final String _defaultSubcategoryFieldName = "Select subcategory";

  double _amount;
  bool isPositive;

  /// String values of the variables which are displayed.
  String _payeeFieldName;
  String _accountFieldName;
  String _subcategoryFieldName;
  String _dateFieldName;

  /// Values used for the transaction
  Payee _payee;
  Account _account;
  SubCategory _subcategory;
  DateTime _date;

  /// List of values to choose each value from, e.g. [_payee]
  /// will be chosen from one of the [payees]
  List<Payee> payees;
  List<Account> accounts;
  List<SubCategory> subcategories;

  AppState appState;

  @override
  void initState() {
    super.initState();

    isPositive = true;
    _amount = 0;
    // Load list of objects from the state/database
    appState = Provider.of<AppState>(context, listen: false);
    payees = appState.payees;
    accounts = appState.accounts;
    subcategories = appState.subcategories;

    // Set initial values of the transaction
    _payee = null;
    _account = null;
    _subcategory = null;
    _date = DateTime.now();

    // Set the default values for the UI
    _payeeFieldName = _defaultPayeeFieldName;
    _accountFieldName = _defaultAccountFieldName;
    _subcategoryFieldName = _defaultSubcategoryFieldName;
    _dateFieldName = getDateString(_date);

    _amountController = TextEditingController(text: currencyFormatter.format(0).trim());
  }

  /// Resets all the field to their default value
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
      _amountController = TextEditingController(text: currencyFormatter.format(0).trim());
      _memoController.clear();
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  /// When tapping on the [SelectValuePage] widget pertaining
  /// to the [Payee] object, it pushes to the route selecting
  /// a [Payee], whose value is stored in [_payee] and whose
  /// name is stored in [_payeeFieldName].
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

  /// When tapping on the [SelectValuePage] widget pertaining
  /// to the [Account] object, it pushes to the route selecting
  /// a  [Account], whose value is stored in [_account] and whose
  /// name is stored in [_accountFieldName].
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

  /// When tapping on the [SelectValuePage] widget pertaining
  /// to the [SubCategory] object, it pushes to the route selecting
  /// a [SubCategory], whose value is stored in [_subcategory] and whose
  /// name is stored in [_subcategoryFieldName].
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

  /// When tapping on the Date row, it opens the DataPicker
  /// which allows one to choose the date as a [DateTime].
  /// Defaults to the current day-year-month.
  /// The [DateTime] gets stored in [_date], and the string
  /// value of that date is saved in [_dateFieldName].
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

  /// Check that all the necessary fields in the form
  /// specified by [_formKey] have been filled.
  /// If that is the case, create a new [MoneyTransaction]
  /// with the information entered, add the transaction and
  /// reset the whole [AddTransactionPage] to the default values
  /// and display a notification.
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

        MoneyTransaction moneyTransaction = new MoneyTransaction(appState.moneyTransactionCount + 1,
            _subcategory.id, _payee.id, _account.id, _amount, _memoController.text, _date);

        appState.addTransaction(moneyTransaction);
        resetToDefaultTransaction();
        showOverlayNotification(context, "Transaction added");
      } else {
        print("One of the fields does not contain a valid type");
      }
    }
  }

  handleAmountOnSave() {
    if (isPositive)
      _amount = formatCurrencyToDouble(_amountController.text);
    else
      _amount = -formatCurrencyToDouble(_amountController.text);
  }

  // When the switch is set to negative, the text style changes
  // and a minus sign is added in front of the text
  void handleSwitchOnChanged() {
    setState(() {
      isPositive = !isPositive;

      if (isPositive)
        _amountController.text = _amountController.text.substring(1);
      else
        _amountController.text = "-" + _amountController.text;

      // amountLength = isPositive ? 13 : 14;
      //Change the money mask to include a minus
    });
  }

  /// Checks that the amount of the transaction is not 0.
  handleAmountValidate(String value) {
    if (formatCurrencyToDouble(_amountController.text) == 0) {
      return "Value must be different than 0";
    }
    return null;
  }

  /// Reset the amout to "0.00 €" and force the cursor to be
  ///                         ^here
  handleAmountOnTap() {
    _amountController
      ..text = currencyFormatter.format(0).trim()
      ..selection = TextSelection.collapsed(offset: _amountController.text.length - 2);
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
          inputFormatters: [
            LengthLimitingTextInputFormatter(13),
            CurrencyInputFormatter(state.currencyFormatter),
          ],
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.right,
          style: state.isPositive ? state._positiveAmountTextStyle : state._negativeAmountTextStyle,
          validator: (value) => state.handleAmountValidate(value),
          onSaved: state.handleAmountOnSave(),
          onTap: () => state.handleAmountOnTap(),
        ));

    Row containerAndButton = Row(
      children: [
        Expanded(child: amountInputContainer),
        Container(
            child: Switch(
          value: state.isPositive,
          onChanged: (value) => state.handleSwitchOnChanged(),
          activeTrackColor: Colors.greenAccent,
          activeColor: Colors.grey[300],
          inactiveTrackColor: Colors.redAccent,
          inactiveThumbColor: Colors.grey[300],
        )),
      ],
    );
    //Populate the list of container with the number controllers and
    //the custom listTiles
    List<Widget> containerList = [
      containerAndButton,
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
                      Divider(height: 1, color: Colors.black26),
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
