import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:your_budget/appState.dart';
import 'package:your_budget/components/overlayNotifications.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/entries_model.dart';
import 'package:your_budget/models/utils.dart';
import 'package:your_budget/screens/addTransaction/components/CurrencyInputFormatter.dart';
import 'package:your_budget/screens/addTransaction/selectValue.dart';
import 'package:your_budget/components/widgetViewClasses.dart';
import 'package:your_budget/components/rowContainer.dart';

import 'package:provider/provider.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageController createState() => _AddTransactionPageController();
}

class _AddTransactionPageController extends State<AddTransactionPage> {
  TextEditingController _amountController;
  final NumberFormat currencyNumberFormat =
      NumberFormat.currency(locale: 'de', decimalDigits: 2, symbol: '€');

  final TextStyle _positiveAmountTextStyle =
      new TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
  final TextStyle _negativeAmountTextStyle =
      new TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _memoController = new TextEditingController();
  final ScrollController _scrollController = new ScrollController();

  /// Default names will have a different style than selected ones
  final String _defaultPayeeFieldName = "Select payee";
  final String _defaultAccountFieldName = "Select account";
  final String _defaultSubcategoryFieldName = "Select subcategory";

  double _amount;
  bool isPositive;
  int amountLength; //Number of max. characters for the amount

  /// String values of the variables which are displayed.
  String _payeeFieldName;
  String _accountFieldName;
  String _subcategoryFieldName;
  String _dateFieldName;

  /// Values used for the transaction
  dynamic _payee;
  Account _account;
  SubCategory _subcategory;
  DateTime _date;

  /// List of values to choose each value from, e.g. [_payee]
  /// will be chosen from one of the [payees]
  List<Payee> payees;
  List<SubCategory> subcategories;
  List<Account> accounts;
  List payeesAndAccounts = [];
  AppState appState;

  @override
  void initState() {
    super.initState();

    isPositive = true;
    _amount = 0;
    amountLength = 16;
    // Load list of objects from the state/database
    appState = Provider.of<AppState>(context, listen: false);
    payees = appState.payees;
    accounts = appState.accounts;
    subcategories = appState.subcategories;

    payeesAndAccounts.addAll(payees);
    payeesAndAccounts.addAll(accounts);

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

    _amountController = TextEditingController(text: currencyNumberFormat.format(0).trim());
  }

  /// Resets all the field to their default value
  void resetToDefaultTransaction() {
    setState(() {
      isPositive = true;
      _amount = 0;
      amountLength = 16;

      _payee = null;
      _account = null;
      _subcategory = null;
      _date = DateTime.now();
      _payeeFieldName = _defaultPayeeFieldName;
      _accountFieldName = _defaultAccountFieldName;
      _subcategoryFieldName = _defaultSubcategoryFieldName;
      _dateFieldName = getDateString(_date);
      _amountController = TextEditingController(text: currencyNumberFormat.format(0).trim());
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
          builder: (context) => SelectValuePage(title: "Payees", listEntries: payeesAndAccounts)),
    ).then((returnElement) {
      if (returnElement != null) {
        setState(() {
          _payee = returnElement;
          _payeeFieldName = returnElement.name;
        });
      }
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
      if (returnElement != null) {
        setState(() {
          _account = returnElement;
          _accountFieldName = returnElement.name;
        });
      }
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
      if (returnElement != null) {
        setState(() {
          _subcategory = returnElement;
          _subcategoryFieldName = returnElement.name;
        });
      }
    });
  }

  /// When tapping on the Date row, it opens the DataPicker
  /// which allows one to choose the date as a [DateTime].
  /// Defaults to the current day-year-month.
  /// The [DateTime] gets stored in [_date], and the string
  /// value of that date is saved in [_dateFieldName].
  Future<Null> handleOnTapDate(BuildContext context) async {
    //TODO: Restrict date to 24 months
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
  void addMoneyTransaction() async {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      if (_payee != null && _account != null && _subcategory != null) {
        _amount = formatCurrencyToDouble(_amountController.text, isPositive);

        print("Form validated");
        print("Amount : $_amount");
        print("Payee : $_payeeFieldName");
        print("Account : $_accountFieldName");
        print("Subcategory : ${_payee is Payee ? 'No subcategory' : _subcategoryFieldName}");
        print("Date: $_dateFieldName");
        print("Memo : ${_memoController.text}");

        // Input as payee ID the opposite of the account ID when we select
        // an account instead of a payee in the 'Payee' field
        print("_payee is of type ${_payee is Payee ? "Payee" : "Account"}");
        int payeeId = _payee is Payee ? _payee.id : -_account.id;

        appState.addTransaction(
          subcatId: _payee is Payee ? _subcategory.id : Constants.UNASSIGNED_SUBCAT_ID,
          payeeId: payeeId,
          accountId: _account.id,
          amount: _amount,
          memo: _memoController.text,
          date: _date,
        );

        resetToDefaultTransaction();
        showOverlayNotification(context, "Transaction added");
      } else {
        print("One of the fields does not contain a valid type");
      }
    }
  }

  handleAmountOnSave() {
    _amount = formatCurrencyToDouble(_amountController.text, isPositive);
  }

  // When the switch is set to the 'off' position, the text style changes
  // and a minus sign is added in front of the text.
  void handleSwitchOnChanged() {
    setState(() {
      isPositive = !isPositive;
      if (isPositive && _amountController.text[0] == '-')
        _amountController.text = _amountController.text.substring(1);
      else if (!isPositive) _amountController.text = "-" + _amountController.text;

      // Change the maximal possible length of the amount to account for
      // the minus sign.
      amountLength = isPositive ? 16 : 17;
      // Lastly, set the offset to the correct position.
      _setOffsetToLastDigit();
    });
  }

  /// Checks that the amount of the transaction is not 0.
  handleAmountValidate(String value) {
    if (formatCurrencyToDouble(_amountController.text, isPositive) == 0) {
      return "Value must be different than 0";
    }
    return null;
  }

  /// Reset [_amountController.text] to "0.00 €" or "-0.00€", depending on
  /// the value of [isPositive]
  handleAmountOnTap() {
    String zero = currencyNumberFormat.format(0).trim();
    _amountController.text = isPositive ? zero : "-" + zero;
    _setOffsetToLastDigit();
  }

  /// Set the cursor offset to the last digit of the text.
  _setOffsetToLastDigit() {
    _amountController.selection =
        TextSelection.collapsed(offset: _amountController.text.length - 2);
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
    /// This [TextFormField] handles the amount selected while providing
    /// an intuitive experience to the user, who does not need to manually
    /// separators and currencies.
    /// The length is limited by a [LengthLimitingTextInputFormatter] to
    /// [state.amountLength] which is equivalent to a maximal value of
    /// 999.999.999,99 €.
    /// The currency format is handled by [CurrencyInputFormatter].
    /// [onTap()] resets the value to a chosen default value.
    Container amountInputContainer = Container(
        height: 50,
        alignment: Alignment.centerRight,
        padding: new EdgeInsets.symmetric(horizontal: 10.0),
        child: TextFormField(
          decoration: new InputDecoration.collapsed(
            hintText: "",
          ),
          keyboardType: TextInputType.number,
          controller: state._amountController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(state.amountLength),
            CurrencyInputFormatter(state.currencyNumberFormat, state.isPositive),
          ],
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.right,
          style: state.isPositive ? state._positiveAmountTextStyle : state._negativeAmountTextStyle,
          validator: (value) => state.handleAmountValidate(value),
          // onSaved: state.handleAmountOnSave(),
          onTap: () => state.handleAmountOnTap(),
        ));

    Row containerAndButton = Row(
      children: [
        Expanded(child: amountInputContainer),
        Container(
            child: Switch(
          value: state.isPositive,
          onChanged: (value) => state.handleSwitchOnChanged(),
          activeTrackColor: Constants.GREEN_COLOR,
          activeColor: Colors.grey[300],
          activeThumbImage: new AssetImage("assets/plus.png"),
          inactiveThumbImage: new AssetImage("assets/minus.png"),
          inactiveTrackColor: Constants.RED_COLOR,
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

          /// [state._payee] accepts both an object of type [Payee] or [Account].
          /// If it is of type Account, make the GestureDetector untappable,
          /// set the default text style and change the text.
          onTap: () => state._payee is Account ? null : state.handleOnTapCategory(),
          child: rowContainer(
              "Category",
              Text(state._payee is Account ? "No subcategory needed" : state._subcategoryFieldName,
                  style: (state._subcategoryFieldName == state._defaultSubcategoryFieldName ||
                          state._payee is Account)
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
        // TODO: Error message
        FloatingActionButton(
          child: Text("Enter"),
          onPressed: () => state.addMoneyTransaction(),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New transaction"),
          leading: Icon(Constants.ADD_TRANSACTION_ICON),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(FontAwesomeIcons.bars),
            ),
          ],
        ),
        body: Consumer<AppState>(builder: (context, appState, child) {
          if (appState.allCategories.isEmpty) {
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
