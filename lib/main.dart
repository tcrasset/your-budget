import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/constants.dart';
// import 'package:mybudget/screens/addAccount/addAccount.dart';

import 'package:mybudget/screens/addTransaction/addTransaction.dart';

import 'package:mybudget/screens/budget/budgetPage.dart';
import 'package:mybudget/models/database_creator.dart';
import 'package:mybudget/waitingscreen.dart';
import 'package:mybudget/screens/showTransactions/showTransactionsPage.dart';
import 'package:provider/provider.dart';
// import 'package:mybudget/searchPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDatabase();
  runApp(MyBudget());
}

class MyBudget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = AppState();
    return ChangeNotifierProvider<AppState>.value(value: appState, child: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  List<Widget> _tabs = [
    //AddAccount(),

    BudgetPage(title: 'Bugdet Page'),
    AddTransactionPage(),
    ShowTransactionPage(title: "Transactions")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    if (appState.allCategories.isNotEmpty) {
      return MaterialApp(
        home: Scaffold(
          body: _tabs[_currentTab],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentTab,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: FaIcon(BUDGET_ICON),
                title: Text("Budget"),
              ),
              BottomNavigationBarItem(
                  icon: FaIcon(ADD_TRANSACTION_ICON), title: Text("Add transaction")),
              BottomNavigationBarItem(
                  icon: FaIcon(ALLTRANSACTION_ICON), title: Text("Transactions")),
            ],
          ),
        ),
      );
    }
    return WaitingScreen();
  }
}
