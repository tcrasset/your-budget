import 'package:flutter/material.dart';
import 'budgetPage.dart';
import 'transactionPage.dart';


void main() => runApp(MyBudget());


class MyBudget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Budget"),
                Tab(text: "Transactions"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BudgetPage(title: 'Bugdet Page'),
              TransactionPage(),
            ],
          ),
        ),
      ),
    );
  }
}