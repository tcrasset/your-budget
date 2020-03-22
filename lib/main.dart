import 'package:flutter/material.dart';
import 'package:mybudget/addTransactionPage.dart';
import 'package:mybudget/database_creator.dart';
import 'package:mybudget/budgetPage.dart';
import 'package:mybudget/showTransactionsPage.dart';
// import 'package:mybudget/searchPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDatabase();
  runApp(MyBudget());
}

// Contains the AppBar that lets the user choose between
// different pages
class MyBudget extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        // length: 2,
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
              ShowTransactionPage(title:"Transactions")
            ],
          ),
        ),
      ),
    );
  }
}