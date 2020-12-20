import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../appState.dart';
import '../../components/overlayNotifications.dart';
import '../../components/widgetViewClasses.dart';
import '../../models/categories.dart';
import '../../models/constants.dart';
import '../../models/entries.dart';
import '../../models/utils.dart';
import 'components/CurrencyInputFormatter.dart';
import 'components/account_field.dart';
import 'components/amount_input_container.dart';
import 'components/amount_switch.dart';
import 'components/date_field.dart';
import 'components/memo_field.dart';
import 'components/payee_field.dart';
import 'components/subcategory_field.dart';
import 'selectValue.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageController createState() =>
      _AddTransactionPageController();
}

class _AddTransactionPageController extends State<AddTransactionPage> {
  TextEditingController amountController;
  final NumberFormat currencyNumberFormat =
      NumberFormat.currency(locale: 'de', decimalDigits: 2, symbol: '€');

  final _formKey = GlobalKey<FormState>();

  final TextEditingController memoController = new TextEditingController();
  final ScrollController _scrollController = new ScrollController();

  /// Default names will have a different style than selected ones
  final String defaultPayeeFieldName = "Select payee";
  final String defaultAccountFieldName = "Select account";
  final String defaultSubcategoryFieldName = "Select subcategory";

  double _amount;
  bool isPositive;
  int amountLength; //Number of max. characters for the amount

  /// String values of the variables which are displayed.
  String payeeFieldName;
  String accountFieldName;
  String subcategoryFieldName;
  String dateFieldName;

  /// Values used for the transaction
  dynamic payee;
  Account _account;
  var _subcategory;
  DateTime _date;

  /// List of values to choose each value from, e.g. [payee]
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
    payee = null;
    _account = null;
    _subcategory = null;
    _date = DateTime.now();

    // Set the default values for the UI
    payeeFieldName = defaultPayeeFieldName;
    accountFieldName = defaultAccountFieldName;
    subcategoryFieldName = defaultSubcategoryFieldName;
    dateFieldName = getDateString(_date);

    amountController =
        TextEditingController(text: currencyNumberFormat.format(0).trim());
  }

  /// Resets all the field to their default value
  void resetToDefaultTransaction() {
    setState(() {
      isPositive = true;
      _amount = 0;
      amountLength = 16;

      payee = null;
      _account = null;
      _subcategory = null;
      _date = DateTime.now();
      payeeFieldName = defaultPayeeFieldName;
      accountFieldName = defaultAccountFieldName;
      subcategoryFieldName = defaultSubcategoryFieldName;
      dateFieldName = getDateString(_date);
      amountController =
          TextEditingController(text: currencyNumberFormat.format(0).trim());
      memoController.clear();
    });
  }

  @override
  void dispose() {
    amountController.dispose();
    memoController.dispose();
    super.dispose();
  }

  /// When tapping on the [SelectValuePage] widget pertaining
  /// to the [Payee] object, it pushes to the route selecting
  /// a [Payee], whose value is stored in [payee] and whose
  /// name is stored in [payeeFieldName].
  handleOnTapPayee() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SelectValuePage(title: "Payees", listEntries: payeesAndAccounts)),
    ).then((returnElement) {
      if (returnElement != null)
        _setPayee(returnElement);

    });
  }

  void _setPayee(returnElement) {
    setState(() {
        payee = returnElement;
        payeeFieldName = returnElement.name;
      });
  }

  /// When tapping on the [SelectValuePage] widget pertaining
  /// to the [Account] object, it pushes to the route selecting
  /// a  [Account], whose value is stored in [_account] and whose
  /// name is stored in [accountFieldName].
  handleOnTapAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SelectValuePage(title: "Accounts", listEntries: accounts)),
    ).then((returnElement) {
      if (returnElement != null) {
        _setAccount(returnElement);
      }
    });
  }

  void _setAccount(returnElement) {
    setState(() {
      _account = returnElement;
      accountFieldName = returnElement.name;
    });
  }

  /// When tapping on the [SelectValuePage] widget pertaining
  /// to the [SubCategory] object, it pushes to the route selecting
  /// a [SubCategory], whose value is stored in [_subcategory] and whose
  /// name is stored in [subcategoryFieldName].
  handleOnTapCategory() async {
    dynamic returnElement = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SelectValuePage(
              title: "Subcategories",
              listEntries: _combineSubcategoriesAndToBeBudgeted(),);
        },
      ),
    );

    if (returnElement != null) {
      _setSubcategory(returnElement);
    }
  }

  void _setSubcategory(returnElement) {
    setState(() {
      _subcategory = returnElement;
      subcategoryFieldName = returnElement is SubCategory
          ? returnElement.name
          : returnElement.data;
    });
  }

  List _combineSubcategoriesAndToBeBudgeted() {
    List subcatAndToBeBudgeted = [];
    subcategories.forEach((subcat) {
      subcatAndToBeBudgeted.add(subcat);
    });
    subcatAndToBeBudgeted.add(Text("To be budgeted"));
    return subcatAndToBeBudgeted;
  }

  /// When tapping on the Date row, it opens the DataPicker
  /// which allows one to choose the date as a [DateTime].
  /// Defaults to the current day-year-month.
  /// The [DateTime] gets stored in [_date], and the string
  /// value of that date is saved in [dateFieldName].
  Future<Null> handleOnTapDate(BuildContext context) async {
    DateTime picked = await _pickDate(context);
    _setDate(picked);
  }

  void _setDate(DateTime picked) {
    if (picked != null && picked != _date) picked = addExactEntryTime(picked);
    setState(() {
      _date = picked;
      dateFieldName = getDateString(picked);
    });
  }

  Future<DateTime> _pickDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: getDateYMD(_date),
        firstDate: appState.startingBudgetDate,
        lastDate: getLastDayOfMonth(getMaxBudgetDate()));
    return picked;
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
      if (payee != null && _account != null) {
        _amount = formatCurrencyToDouble(amountController.text, isPositive);

        _printTransactionInformation();

        appState.addTransaction(
          subcatId: _selectSubcatId(),
          payeeId: _selectPayeeId(),
          accountId: _account.id,
          amount: _amount,
          memo: memoController.text,
          date: _date,
        );

        resetToDefaultTransaction();
        showOverlayNotification(context, "Transaction added");
      } else {
        print("One of the fields does not contain a valid type");
      }
    }
  }

  void _printTransactionInformation() {
    print("Form validated");
    print("Amount : $_amount");
    print("Payee : $payeeFieldName");
    print("Account : $accountFieldName");
    print(
        "Subcategory : ${payee is Payee ? 'No subcategory' : subcategoryFieldName}");
    print("Date: $dateFieldName");
    print("Memo : ${memoController.text}");

    // Input as payee ID the opposite of the account ID when we select
    // an account instead of a payee in the 'Payee' field
    print("payee is of type ${payee is Payee ? "Payee" : "Account"}");
  }

  int _selectPayeeId() {
    int payeeId = payee is Payee ? payee.id : -_account.id;
    return payeeId;
  }

  _selectSubcatId() {
    bool subcategoryIsToBeBudgeted = subcategoryFieldName == "To be budgeted";
    if (payee is Payee && !subcategoryIsToBeBudgeted)
      return _subcategory.id;
    else if (payee is Account && !subcategoryIsToBeBudgeted)
      return Constants.UNASSIGNED_SUBCAT_ID;
    else if (subcategoryIsToBeBudgeted) //
      return Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION;
  }

  handleAmountOnSave() {
    _amount = formatCurrencyToDouble(amountController.text, isPositive);
  }

  // When the switch is set to the 'off' position, the text style changes
  // and a minus sign is added in front of the text.
  void handleSwitchOnChanged() {
    setState(() {
      isPositive = !isPositive;

      bool positiveWithMinusSign = isPositive && amountController.text[0] == '-';
      if (positiveWithMinusSign)
        _removeMinusSign();
      else if (!isPositive)
        _addMinusSign();

      _updateAmountLength();
      _setOffsetToLastDigit();
    });
  }

  void _updateAmountLength() {
    amountLength = isPositive ? 16 : 17;
  }

  void _addMinusSign() {
    amountController.text = "-" + amountController.text;
  }

  void _removeMinusSign() {
    amountController.text = amountController.text.substring(1);
  }

  /// Checks that the amount of the transaction is not 0.
  handleAmountValidate(String value) {
    if (formatCurrencyToDouble(amountController.text, isPositive) == 0) {
      return "Value must be different than 0";
    }
    return null;
  }

  /// Reset [amountController.text] to "0.00 €" or "-0.00€", depending on
  /// the value of [isPositive]
  handleAmountOnTap() {
    _setAmountToZero();
    _setOffsetToLastDigit();
  }

  void _setAmountToZero() {
    String zero = currencyNumberFormat.format(0).trim();
    amountController.text = isPositive ? zero : "-" + zero;
  }

  /// Set the cursor offset to the last digit of the text.
  _setOffsetToLastDigit() {
    amountController.selection =
        TextSelection.collapsed(offset: amountController.text.length - 2);
  }

  @override
  Widget build(BuildContext context) => _AddTransactionPageView(this);
}

class _AddTransactionPageView
    extends WidgetView<AddTransactionPage, _AddTransactionPageController> {
  _AddTransactionPageView(_AddTransactionPageController state) : super(state);

  final TextStyle defaultChildTextStyle = TextStyle(
      color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 16.0);
  final TextStyle selectedChildTextStyle =
      TextStyle(color: Colors.black, fontSize: 16.0);

  Widget _myBuildMethod() {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
            height: 400,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: AmountInputContainer(state: state)),
                    AmountSwitch(state: state),
                  ],
                ),
                PayeeField(
                    state: state,
                    defaultChildTextStyle: defaultChildTextStyle,
                    selectedChildTextStyle: selectedChildTextStyle),
                AccountField(
                    state: state,
                    defaultChildTextStyle: defaultChildTextStyle,
                    selectedChildTextStyle: selectedChildTextStyle),
                SubcategoryField(
                    state: state,
                    defaultChildTextStyle: defaultChildTextStyle,
                    selectedChildTextStyle: selectedChildTextStyle),
                DateField(
                    state: state,
                    selectedChildTextStyle: selectedChildTextStyle),
                MemoField(state: state),
              ],
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
