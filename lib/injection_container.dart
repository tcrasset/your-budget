// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/category/i_category_provider.dart';
import 'package:your_budget/domain/constants/i_constants_provider.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/infrastructure/account/account_provider.dart';
import 'package:your_budget/infrastructure/budgetvalue/budgetvalue_provider.dart';
import 'package:your_budget/infrastructure/category/category_provider.dart';
import 'package:your_budget/infrastructure/constants/constants_provider.dart';
import 'package:your_budget/infrastructure/payee/payee_provider.dart';
import 'package:your_budget/infrastructure/subcategory/subcategory_provider.dart';
import 'package:your_budget/infrastructure/transaction/transaction_provider.dart';
import 'package:your_budget/models/database_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final DatabaseProvider dbProvider = DatabaseProvider();
  final Database? database = await dbProvider.open();

  if (database == null) {
    throw Exception("Could not open database.");
  }

  // debugDatabase(database);
  sl.registerSingleton<Database>(database);

  // sl.registerLazySingleton<Queries>(() => SQLQueryClass(database: sl<Database>()));

  final payeeProvider = SQFlitePayeeProvider(database: sl<Database>());
  await payeeProvider.init();

  final transactionProvider = SQFliteTransactionProvider(database: sl<Database>());
  await transactionProvider.init();

  final accountProvider = SQFliteAccountProvider(database: sl<Database>());
  await accountProvider.init();

  final subcategoryProvider = SQFliteSubcategoryProvider(database: sl<Database>());
  await subcategoryProvider.init();

  final budgetvalueProvider = SQFliteBudgetValueProvider(database: sl<Database>());
  await budgetvalueProvider.init();

  final categoryProvider = SQFliteCategoryProvider(database: sl<Database>());
  await categoryProvider.init();

  final constantsProvider = SQFliteConstantsProvider(database: sl<Database>());
  await constantsProvider.init();

  sl.registerSingleton<ITransactionProvider>(transactionProvider);
  sl.registerSingleton<IAccountProvider>(accountProvider);

  sl.registerSingleton<IPayeeProvider>(payeeProvider);
  sl.registerSingleton<ISubcategoryProvider>(subcategoryProvider);
  sl.registerSingleton<IBudgetValueProvider>(budgetvalueProvider);
  sl.registerSingleton<ICategoryProvider>(categoryProvider);

  sl.registerSingleton<IConstantsProvider>(constantsProvider);

  // final AppState appState = AppState(queryContext: sl());
  // await appState.loadStateFromDatabase();
  // sl.registerLazySingleton(() => appState);
}

Future<void> debugDatabase(Database database) async {
  for (final row in await database.query('sqlite_master', columns: ['type', 'name'])) {
    debugPrint(row.values.toString());
  }
}
