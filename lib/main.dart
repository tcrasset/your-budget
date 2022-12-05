// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/application/budget/budget_entry_manager_bloc/budget_entry_manager_bloc.dart';
import 'package:your_budget/application/budget/budgetvalue_watcher_bloc/budgetvalue_watcher_bloc.dart';
import 'package:your_budget/application/budget/category_watcher_bloc/category_watcher_bloc.dart';

// Project imports:
import 'package:your_budget/application/core/bloc_observer.dart';
import 'package:your_budget/application/core/budget_date_cubit.dart';
import 'package:your_budget/application/core/subcategory_watcher_bloc/subcategory_watcher_bloc.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_repository.dart';
import 'package:your_budget/domain/category/i_category_repository.dart';
import 'package:your_budget/injection_container.dart' as injections;
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/addAccount/add_account.dart';
import 'package:your_budget/presentation/pages/addTransaction/add_transaction.dart';
import 'package:your_budget/presentation/pages/budget/budget_page.dart';
import 'package:your_budget/presentation/pages/deleteCategories/delete_categories_state.dart';
import 'package:your_budget/presentation/pages/modifyTransactions/modify_transaction_state.dart';
import 'package:your_budget/presentation/pages/showTransactions/show_transaction_page.dart';

import 'domain/subcategory/i_subcategory_repository.dart';

Future<void> main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await injections.init();
  runApp(MyBudget());
}

class MyBudget extends StatefulWidget {
  @override
  MyBudgetState createState() => MyBudgetState();
}

class MyBudgetState extends State<MyBudget> {
  int _currentTab = 0;

  final List<Widget> _tabs = [
    const BudgetPage(title: 'Bugdet Page'),
    const AddAccountPage(title: 'Accounts'),
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
    // final AppState appState = Provider.of<AppState>(context);
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Constants.PRIMARY_COLOR,
        accentColor: Constants.SECONDARY_COLOR,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<SubcategoryWatcherBloc>(
            create: (context) => SubcategoryWatcherBloc(
                subcategoryRepository: GetIt.instance<ISubcategoryRepository>())
              ..add(const SubcategoryWatcherEvent.watchSubcategoriesStarted()),
          ),
          BlocProvider<CategoryWatcherBloc>(
            create: (context) =>
                CategoryWatcherBloc(categoryRepository: GetIt.instance<ICategoryRepository>())
                  ..add(const CategoryWatcherEvent.watchCategoriesStarted()),
          ),
          BlocProvider<BudgetDateCubit>(create: (_) => BudgetDateCubit()),
          BlocProvider<BudgetEntryManagerBloc>(
            create: (context) => BudgetEntryManagerBloc(
              budgetvalueRepository: GetIt.instance<IBudgetValueRepository>(),
              budgetDateCubit: context.read<BudgetDateCubit>(),
            )..add(const BudgetEntryManagerEvent.initialized()),
          ),
          BlocProvider<BudgetValueWatcherBloc>(
            create: (context) => BudgetValueWatcherBloc(
                budgetvalueRepository: GetIt.instance<IBudgetValueRepository>(),
                budgetManagerBloc: context.read<BudgetEntryManagerBloc>(),
                budgetDateCubit: context.read<BudgetDateCubit>())
              ..add(BudgetValueWatcherEvent.watchBudgetValuesStarted(
                  context.read<BudgetDateCubit>().state)),
          ),
        ],
        child: Scaffold(
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
                label: "Add transaction",
              ),
              const BottomNavigationBarItem(
                icon: FaIcon(Constants.ALLTRANSACTION_ICON),
                label: "Transactions",
              ),
            ],
          ),
        ),
      ),
    );

    // return const WaitingScreen();
  }
}
