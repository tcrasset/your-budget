// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/appstate.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/screens/addAccount/add_account.dart';
import 'package:your_budget/screens/addTransaction/add_transaction.dart';
import 'package:your_budget/screens/budget/budget_page.dart';
import 'package:your_budget/screens/budget/budget_page_state.dart';
import 'package:your_budget/screens/deleteCategories/delete_categories_state.dart';
import 'package:your_budget/screens/showTransactions/show_transaction_page.dart';
import 'package:your_budget/screens/showTransactions/show_transaction_page_state.dart';
import 'package:your_budget/waiting_screen.dart';
import 'injection_container.dart' as injections;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injections.init();
  runApp(MyBudget());
}

class MyBudget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<AppState>.value(value: GetIt.instance<AppState>()),
      // ChangeNotifierProvider<BudgetPageState>(create: (_) => BudgetPageState())
      ChangeNotifierProvider<ShowTransactionsState>(
          create: (_) => ShowTransactionsState()),
      ChangeNotifierProvider<DeleteCategoriesState>(
          create: (_) => DeleteCategoriesState()),
    ], child: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  final List<Widget> _tabs = [
    ChangeNotifierProvider(
        create: (_) => BudgetPageState(),
        child: const BudgetPage(title: 'Bugdet Page')),
    const AddAccountRoute(title: 'Accounts'),
    AddTransactionPage(),
    const ShowTransactionPage(title: "Transactions")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);
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
              const BottomNavigationBarItem(
                icon: FaIcon(Constants.BUDGET_ICON),
                label: "Budget",
              ),
              const BottomNavigationBarItem(
                icon: FaIcon(Constants.ACCOUNT_ICON),
                label: "Accounts",
              ),
              const BottomNavigationBarItem(
                  icon: FaIcon(Constants.ADD_TRANSACTION_ICON),
                  label: "Add transaction"),
              const BottomNavigationBarItem(
                  icon: FaIcon(Constants.ALLTRANSACTION_ICON),
                  label: "Transactions"),
            ],
          ),
        ),
      );
    }
    return const WaitingScreen();
  }
}
