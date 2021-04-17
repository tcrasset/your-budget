part of 'subcategory_watcher_bloc.dart';

@freezed
abstract class SubcategoryWatcherEvent with _$SubcategoryWatcherEvent {
  const factory SubcategoryWatcherEvent.watchSubcategoriesStarted() = _SubcategoryWatchStarted;
  const factory SubcategoryWatcherEvent.subcategoriesReceived(
      Either<ValueFailure, List<Subcategory>> failureOrSubcategories) = _SubcategoriesReceived;
}
