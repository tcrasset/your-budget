part of 'category_watcher_bloc.dart';

@freezed
class CategoryWatcherState with _$CategoryWatcherState {
  const factory CategoryWatcherState.initial() = _Initial;

  const factory CategoryWatcherState.loading() = _Loading;
  const factory CategoryWatcherState.loadSuccess(List<Category> categories) =
      _CategoryLoadSuccess;
  const factory CategoryWatcherState.loadFailure(ValueFailure categoryFailure) =
      _CategoryLoadFailure;
}
