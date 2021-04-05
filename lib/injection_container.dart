// Package imports:
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import 'package:your_budget/infrastructure/transaction/transaction_repository.dart';
import 'appstate.dart';
import 'models/database_provider.dart';
import 'models/queries.dart';
import 'models/sql_queries.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final DatabaseProvider dbProvider = DatabaseProvider();
  final Database database = await dbProvider.open();
  sl.registerSingleton<Database>(database);
  sl.registerLazySingleton<Queries>(
      () => SQLQueryClass(database: sl<Database>()));
  sl.registerSingleton<ITransactionRepository>(
      SQFliteTransactionRepository(database: sl<Database>()));

  final AppState appState = AppState(queryContext: sl());
  await appState.loadStateFromDatabase();
  sl.registerLazySingleton(() => appState);
}
