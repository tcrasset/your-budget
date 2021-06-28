// Package imports:
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'appstate.dart';
import 'domain/account/i_account_repository.dart';
import 'domain/payee/i_payee_repository.dart';
import 'domain/subcategory/i_subcategory_repository.dart';
import 'domain/transaction/i_transaction_repository.dart';
import 'infrastructure/account/account_repository.dart';
import 'infrastructure/payee/payee_repository.dart';
import 'infrastructure/subcategory/subcategory_repository.dart';
import 'infrastructure/transaction/transaction_repository.dart';
import 'models/database_provider.dart';
import 'models/queries.dart';
import 'models/sql_queries.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final DatabaseProvider dbProvider = DatabaseProvider();
  final Database database = await (dbProvider.open() as Future<Database>);

  // debugDatabase(database);
  sl.registerSingleton<Database>(database);
  sl.registerLazySingleton<Queries>(() => SQLQueryClass(database: sl<Database>()));
  sl.registerSingleton<ITransactionRepository>(
      SQFliteTransactionRepository(database: sl<Database>()));
  sl.registerSingleton<IAccountRepository>(SQFliteAccountRepository(database: sl<Database>()));
  sl.registerSingleton<IPayeeRepository>(SQFlitePayeeRepository(database: sl<Database>()));
  sl.registerSingleton<ISubcategoryRepository>(
      SQFliteSubcategoryRepository(database: sl<Database>()));

  // final AppState appState = AppState(queryContext: sl());
  // await appState.loadStateFromDatabase();
  // sl.registerLazySingleton(() => appState);
}

Future<void> debugDatabase(Database database) async {
  (await database.query('sqlite_master', columns: ['type', 'name'])).forEach((row) {
    debugPrint(row.values.toString());
  });
}
