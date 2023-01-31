// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/application/budget/to_be_budgeted_cubit.dart';

// Project imports:
import 'package:your_budget/application/core/bloc_observer.dart';
import 'package:your_budget/application/core/budget_date_cubit.dart';
import 'package:your_budget/application/core/subcategory_watcher_bloc/subcategory_watcher_bloc.dart';
import 'package:your_budget/application/showTransactions/selected_account_cubit/selected_account_cubit.dart';
import 'package:your_budget/domain/account/account_repository.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/budget/budget_repository.dart';
import 'package:your_budget/domain/budget/to_be_budgeted_repository.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/category/i_category_provider.dart';
import 'package:your_budget/domain/constants/i_constants_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/domain/transaction/transaction_repository.dart';
import 'package:your_budget/startup.dart' as startup;
import 'package:your_budget/injection_container.dart' as injections;
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/addAccount/add_account.dart';
import 'package:your_budget/presentation/pages/addTransaction/add_transaction.dart';
import 'package:your_budget/presentation/pages/budget/budget_page.dart';
import 'package:your_budget/presentation/pages/deleteCategories/delete_categories_state.dart';
import 'package:your_budget/presentation/pages/modifyTransactions/modify_transaction_state.dart';
import 'package:your_budget/presentation/pages/showTransactions/show_transaction_page.dart';

import 'domain/subcategory/i_subcategory_provider.dart';

Future<void> main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await injections.init();
  await startup.addBudgetsUntilMaxDate();
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => BudgetRepository(
            budgetvalueProvider: GetIt.instance<IBudgetValueProvider>(),
            categoryProvider: GetIt.instance<ICategoryProvider>(),
            subcategoryProvider: GetIt.instance<ISubcategoryProvider>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => ToBeBudgetedRepository(
            subcategoryProvider: GetIt.instance<ISubcategoryProvider>(),
            transactionProvider: GetIt.instance<ITransactionProvider>(),
            constantsProvider: GetIt.instance<IConstantsProvider>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => TransactionRepository(
            transactionProvider: GetIt.instance<ITransactionProvider>(),
            budgetValueProvider: GetIt.instance<IBudgetValueProvider>(),
            constantsProvider: GetIt.instance<IConstantsProvider>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => AccountRepository(
            accountProvider: GetIt.instance<IAccountProvider>(),
            transactionProvider: GetIt.instance<ITransactionProvider>(),
            subcategoryProvider: GetIt.instance<ISubcategoryProvider>(),
            payeeProvider: GetIt.instance<IPayeeProvider>(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
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
                    subcategoryRepository: GetIt.instance<ISubcategoryProvider>(),
                  )..add(const SubcategoryWatcherEvent.watchSubcategoriesStarted()),
                ),
                BlocProvider<BudgetDateCubit>(create: (_) => BudgetDateCubit()),
                BlocProvider<ToBeBudgetedCubit>(
                  create: (_) => ToBeBudgetedCubit(
                    initialAmount: Amount.fromDouble(0),
                    toBeBudgetedRepository: context.read<ToBeBudgetedRepository>(),
                  )..update(),
                ),
                BlocProvider<SelectedAccountCubit>(
                  create: (_) => SelectedAccountCubit(
                    accountRepository: context.read<AccountRepository>(),
                  ),
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
        },
      ),
    );

    // return const WaitingScreen();
  }
}
