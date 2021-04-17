// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_repository.dart';
import 'package:your_budget/models/categories.dart';

part 'subcategory_watcher_event.dart';
part 'subcategory_watcher_state.dart';
part 'subcategory_watcher_bloc.freezed.dart';

class SubcategoryWatcherBloc extends Bloc<SubcategoryWatcherEvent, SubcategoryWatcherState> {
  final ISubcategoryRepository subcategoryRepository;

  SubcategoryWatcherBloc({@required this.subcategoryRepository})
      : super(const SubcategoryWatcherState.initial());

  StreamSubscription<List<SubCategory>> _subcategoryStreamSubscription;

  @override
  Stream<SubcategoryWatcherState> mapEventToState(
    SubcategoryWatcherEvent event,
  ) async* {
    yield* event.map(watchSubcategoriesStarted: (e) async* {
      yield const SubcategoryWatcherState.loading();
      await _subcategoryStreamSubscription?.cancel();

      subcategoryRepository.watchAllSubcategories().listen(
            (failureOrSubcategories) =>
                add(SubcategoryWatcherEvent.subcategoriesReceived(failureOrSubcategories)),
          );
    }, subcategoriesReceived: (e) async* {
      yield e.failureOrSubcategories.fold(
        (f) => SubcategoryWatcherState.loadFailure(f),
        (subcategorys) => SubcategoryWatcherState.loadSuccess(subcategorys),
      );
    });
  }
}
