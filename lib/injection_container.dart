// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:your_budget/appstate.dart';
import 'package:your_budget/models/database_provider.dart';
import 'package:your_budget/models/queries.dart';
import 'package:your_budget/models/sql_queries.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final DatabaseProvider dbProvider = DatabaseProvider();
  final database = await dbProvider.open();
  sl.registerLazySingleton<Queries>(() => SQLQueryClass(database: database));

  final AppState appState = AppState(queryContext: sl());
  await appState.loadStateFromDatabase();
  sl.registerLazySingleton(() => appState);
}
