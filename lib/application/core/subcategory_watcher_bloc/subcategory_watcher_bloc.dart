// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';

part 'subcategory_watcher_event.dart';
part 'subcategory_watcher_state.dart';
part 'subcategory_watcher_bloc.freezed.dart';

class SubcategoryWatcherBloc extends Bloc<SubcategoryWatcherEvent, SubcategoryWatcherState> {
  final ISubcategoryProvider subcategoryRepository;
  StreamSubscription<List<Subcategory>>? _subcategoryStreamSubscription;

  SubcategoryWatcherBloc({required this.subcategoryRepository})
      : super(const SubcategoryWatcherState.initial()) {
    on<_SubcategoryWatchStarted>(_onSubcategoryWatchStarted);
    on<_SubcategoriesReceived>(_onSubcategoriesReceived);
  }

  Future<void> _onSubcategoryWatchStarted(
    _SubcategoryWatchStarted event,
    Emitter<SubcategoryWatcherState> emit,
  ) async {
    emit(const SubcategoryWatcherState.loading());
    await _subcategoryStreamSubscription?.cancel();

    subcategoryRepository.watchAllSubcategories().listen(
          (failureOrSubcategories) =>
              add(SubcategoryWatcherEvent.subcategoriesReceived(failureOrSubcategories)),
        );
  }

  Future<void> _onSubcategoriesReceived(
    _SubcategoriesReceived event,
    Emitter<SubcategoryWatcherState> emit,
  ) async {
    var newState = event.failureOrSubcategories.fold(
      (f) => SubcategoryWatcherState.loadFailure(f),
      (subcategories) => SubcategoryWatcherState.loadSuccess(subcategories),
    );

    emit(newState);
  }
}
