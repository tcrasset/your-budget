import 'package:get_it/get_it.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/SQLQueries.dart';
import 'package:your_budget/models/queries.dart';

final sl = GetIt.instance;



void init(){
  sl.registerFactory(() => AppState(queryContext: sl()));
  sl.registerLazySingleton<Queries>(() => SQLQueryClass());
}
