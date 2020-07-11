import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/screens/addAccount/addAccount.dart';

import 'package:mybudget/screens/addTransaction/addTransaction.dart';

import 'package:mybudget/screens/budget/budgetPage.dart';
import 'package:mybudget/models/database_creator.dart';
import 'package:mybudget/screens/waitingscreen.dart';
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    if (appState.allCategories.isNotEmpty) {
      return MaterialApp(
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: "Add account"),
                  Tab(text: "Budget"),
                  Tab(text: "Add new Transaction"),
                  Tab(text: "Transactions")
                ],
              ),
            ),
            body: TabBarView(
              children: [
                AddAccount(),
                BudgetPage(title: 'Bugdet Page'),
                AddTransactionPage(),
                ShowTransactionPage(title: "Transactions")
              ],
            ),
          ),
        ),
      );
    }
    return WaitingScreen();
  }
}
