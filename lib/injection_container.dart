// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:your_budget/appstate.dart';
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_repository.dart';
import 'package:your_budget/domain/category/i_category_provider.dart';
import 'package:your_budget/domain/constants/i_constants_provider.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_repository.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import 'package:your_budget/infrastructure/account/account_repository.dart';
import 'package:your_budget/infrastructure/budgetvalue/budgetvalue_repository.dart';
import 'package:your_budget/infrastructure/category/category_provider.dart';
import 'package:your_budget/infrastructure/constants/constants_provider.dart';
import 'package:your_budget/infrastructure/payee/payee_provider.dart';
import 'package:your_budget/infrastructure/subcategory/subcategory_repository.dart';
import 'package:your_budget/infrastructure/transaction/transaction_repository.dart';
import 'package:your_budget/models/database_provider.dart';
import 'package:your_budget/models/queries.dart';
import 'package:your_budget/models/sql_queries.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final DatabaseProvider dbProvider = DatabaseProvider();
  final Database? database = await (dbProvider.open() as Future<Database?>);

  if (database == null) {
    return;
  }
  // debugDatabase(database);
  sl.registerSingleton<Database>(database);
  sl.registerLazySingleton<Queries>(() => SQLQueryClass(database: sl<Database>()));
  sl.registerSingleton<ITransactionRepository>(
    SQFliteTransactionRepository(database: sl<Database>()),
  );
  sl.registerSingleton<IAccountRepository>(SQFliteAccountRepository(database: sl<Database>()));
  sl.registerSingleton<IPayeeProvider>(SQFlitePayeeProvider(database: sl<Database>()));
  sl.registerSingleton<ISubcategoryRepository>(
    SQFliteSubcategoryRepository(database: sl<Database>()),
  );
  sl.registerSingleton<IBudgetValueRepository>(
    SQFliteBudgetValueRepository(database: sl<Database>()),
  );
  sl.registerSingleton<ICategoryProvider>(
    SQFliteCategoryProvider(database: sl<Database>()),
  );

  sl.registerSingleton<IConstantsProvider>(
    SQFliteConstantsProvider(database: sl<Database>()),
  );

  // final AppState appState = AppState(queryContext: sl());
  // await appState.loadStateFromDatabase();
  // sl.registerLazySingleton(() => appState);
}

Future<void> debugDatabase(Database database) async {
  (await database.query('sqlite_master', columns: ['type', 'name'])).forEach((row) {
    debugPrint(row.values.toString());
  });
}
