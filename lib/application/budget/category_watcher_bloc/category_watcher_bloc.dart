import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/domain/category/i_category_repository.dart';
import 'package:your_budget/domain/core/value_failure.dart';

import '../../../domain/category/category.dart';

part 'category_watcher_event.dart';
part 'category_watcher_state.dart';
part 'category_watcher_bloc.freezed.dart';

class CategoryWatcherBloc
    extends Bloc<CategoryWatcherEvent, CategoryWatcherState> {
  final ICategoryRepository categoryRepository;
  StreamSubscription<List<Category>>? _categoryStreamSubscription;

  CategoryWatcherBloc({required this.categoryRepository})
      : super(const CategoryWatcherState.initial()) {
    on<_CategoryWatchStarted>(_onCategoryWatchStarted);
    on<_CategoriesReceived>(_onCategoriesReceived);
  }

  Future<void> _onCategoryWatchStarted(
    _CategoryWatchStarted event,
    Emitter<CategoryWatcherState> emit,
  ) async {
    emit(const CategoryWatcherState.loading());
    await _categoryStreamSubscription?.cancel();

    categoryRepository.watchAllCategories().listen(
          (failureOrCategories) =>
              add(CategoryWatcherEvent.categoriesReceived(failureOrCategories)),
        );
  }

  Future<void> _onCategoriesReceived(
    _CategoriesReceived event,
    Emitter<CategoryWatcherState> emit,
  ) async {
    var newState = event.failureOrCategories.fold(
      (f) => CategoryWatcherState.loadFailure(f),
      (categories) => CategoryWatcherState.loadSuccess(categories),
    );

    emit(newState);
  }
}
