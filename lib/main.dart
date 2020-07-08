import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';

import 'package:mybudget/screens/addTransaction/addTransaction.dart';

import 'package:mybudget/screens/budget/budgetPage.dart';
import 'package:mybudget/models/database_creator.dart';
import 'package:mybudget/screens/showTransactions/showTransactionsPage.dart';
import 'package:provider/provider.dart';
// import 'package:mybudget/searchPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDatabase();
  runApp(ChangeNotifierProvider(create: (context) => AppState(), child: MyBudget()));
}

class MyBudget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Budget"),
                Tab(text: "Add new Transaction"),
                Tab(text: "Transactions")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BudgetPage(title: 'Bugdet Page'),
              AddTransactionPage(),
              ShowTransactionPage(title: "Transactions")
            ],
          ),
        ),
      ),
    );
  }
}
