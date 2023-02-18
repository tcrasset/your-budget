part of 'subcategory_watcher_bloc.dart';

@freezed
class SubcategoryWatcherState with _$SubcategoryWatcherState {
  const factory SubcategoryWatcherState.initial() = _Initial;

  const factory SubcategoryWatcherState.loading() = _Loading;
  const factory SubcategoryWatcherState.loadSuccess(
    List<Subcategory> subcategories,
  ) = _SubcategoryLoadSuccess;
  const factory SubcategoryWatcherState.loadFailure(
    ValueFailure subcategoryFailure,
  ) = _SubcategoryLoadFailure;
}
