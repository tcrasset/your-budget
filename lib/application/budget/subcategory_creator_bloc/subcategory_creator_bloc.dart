import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/domain/budget/subcategory_repository.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';

import 'package:your_budget/domain/subcategory/subcategory.dart';

part 'subcategory_creator_bloc.freezed.dart';
part 'subcategory_creator_event.dart';
part 'subcategory_creator_state.dart';

class SubcategoryCreatorBloc extends Bloc<SubcategoryCreatorEvent, SubcategoryCreatorState> {
  final SubcategoryRepository subcategoryRepository;

  SubcategoryCreatorBloc({required this.subcategoryRepository})
      : super(SubcategoryCreatorState.initial()) {
    on<_Initialized>(_onInitialized);
    on<_NameChanged>(_onNameChanged);
    on<_Saved>(_onSaved);
  }

  void _onInitialized(_Initialized event, Emitter<SubcategoryCreatorState> emit) {
    final newState = state.copyWith(
      subcategory: state.subcategory.copyWith(categoryID: event.categoryId),
      saveFailureOrSuccessOption: none(),
    );
    emit(newState);
  }

  void _onNameChanged(_NameChanged event, Emitter<SubcategoryCreatorState> emit) {
    final newState = state.copyWith(
      subcategory: state.subcategory.copyWith(name: Name(event.name)),
      saveFailureOrSuccessOption: none(),
    );
    emit(newState);
  }

  Future<void> _onSaved(_Saved event, Emitter<SubcategoryCreatorState> emit) async {
    Either<ValueFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(isSaving: true));

    if (state.subcategory.failureOption.isNone()) {
      failureOrSuccess = (await subcategoryRepository.create(state.subcategory)).replace(unit);
    }

    final newState = state.copyWith(
      isSaving: false,
      showErrorMessages: true,
      saveFailureOrSuccessOption: optionOf(failureOrSuccess),
    );

    emit(newState);
  }
}
