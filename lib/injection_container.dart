import 'package:get_it/get_it.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/SQLQueries.dart';
import 'package:your_budget/models/database_provider.dart';
import 'package:your_budget/models/queries.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AppState(queryContext: sl()));

  DatabaseProvider dbProvider = DatabaseProvider();
  var database = await dbProvider.open();
  sl.registerLazySingleton<Queries>(() => SQLQueryClass(database: database));
}
