part of 'category_watcher_bloc.dart';

@freezed
class CategoryWatcherEvent with _$CategoryWatcherEvent {
  const factory CategoryWatcherEvent.watchCategoriesStarted() =
      _CategoryWatchStarted;
  const factory CategoryWatcherEvent.categoriesReceived(
    Either<ValueFailure, List<Category>> failureOrCategories,
  ) = _CategoriesReceived;
}
