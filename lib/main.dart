import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/screens/addAccount/addAccount.dart';
// import 'package:your_budget/screens/addAccount/addAccount.dart';

import 'package:your_budget/screens/addTransaction/addTransaction.dart';

import 'package:your_budget/screens/budget/budgetPage.dart';
import 'package:your_budget/models/database_creator.dart';
import 'package:your_budget/screens/budget/budgetPageState.dart';
import 'package:your_budget/screens/deleteCategories/DeleteCategoriesState.dart';
import 'package:your_budget/screens/showTransactions/showTransactionsState.dart';
import 'package:your_budget/waitingscreen.dart';
import 'package:your_budget/screens/showTransactions/showTransactionsPage.dart';
import 'package:provider/provider.dart';
// import 'package:your_budget/searchPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDatabase();
  runApp(MyBudget());
}

class MyBudget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<AppState>(create: (_) => AppState()),
      // ChangeNotifierProvider<BudgetPageState>(create: (_) => BudgetPageState())
      ChangeNotifierProvider<ShowTransactionsState>(create: (_) => ShowTransactionsState()),
      ChangeNotifierProvider<DeleteCategoriesState>(create: (_) => DeleteCategoriesState()),
    ], child: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  List<Widget> _tabs = [
    ChangeNotifierProvider(
        create: (_) => BudgetPageState(), child: BudgetPage(title: 'Bugdet Page')),
    AddAccountRoute(title: 'Accounts'),
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
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Constants.PRIMARY_COLOR,
          accentColor: Constants.SECONDARY_COLOR,
        ),
        home: Scaffold(
          body: _tabs[_currentTab],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentTab,
            unselectedItemColor: Colors.grey[500],
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: FaIcon(Constants.BUDGET_ICON),
                title: Text("Budget"),
              ),
              BottomNavigationBarItem(
                icon: FaIcon(Constants.ACCOUNT_ICON),
                title: Text("Accounts"),
              ),
              BottomNavigationBarItem(
                  icon: FaIcon(Constants.ADD_TRANSACTION_ICON), title: Text("Add transaction")),
              BottomNavigationBarItem(
                  icon: FaIcon(Constants.ALLTRANSACTION_ICON), title: Text("Transactions")),
            ],
          ),
        ),
      );
    }
    return WaitingScreen();
  }
}
