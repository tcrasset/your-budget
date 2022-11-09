import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_repository.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';

part 'subcategory_creator_event.dart';
part 'subcategory_creator_state.dart';
part 'subcategory_creator_bloc.freezed.dart';

class SubcategoryCreatorBloc extends Bloc<SubcategoryCreatorEvent, SubcategoryCreatorState> {
  final ISubcategoryRepository subcategoryRepository;
  SubcategoryCreatorBloc({
    required this.subcategoryRepository,
  }) : super(SubcategoryCreatorState.initialEditing()) {
    on<_NameChanged>(_onNameChanged);
    on<_BudgetedChanged>(_onBudgetedChanged);
    on<_AvailableChanged>(_onAvailableChanged);
    on<_Saved>(_onSaved);
  }

  void _onBudgetedChanged(_BudgetedChanged event, Emitter<SubcategoryCreatorState> emit) => emit(
        state.copyWith(
          subcategory: state.subcategory.copyWith(budgeted: Amount(event.budgeted)),
          saveFailureOrSuccessOption: none(),
        ),
      );

  void _onAvailableChanged(_AvailableChanged event, Emitter<SubcategoryCreatorState> emit) => emit(
        state.copyWith(
          subcategory: state.subcategory.copyWith(available: Amount(event.available)),
          saveFailureOrSuccessOption: none(),
        ),
      );

  void _onNameChanged(_NameChanged event, Emitter<SubcategoryCreatorState> emit) => emit(
        state.copyWith(
          subcategory: state.subcategory.copyWith(name: Name(event.name)),
          saveFailureOrSuccessOption: none(),
        ),
      );

  Future<void> _onSaved(_Saved event, Emitter<SubcategoryCreatorState> emit) async {
    Either<ValueFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(isSaving: true));

    if (state.subcategory.failureOption.isNone()) {
      failureOrSuccess = state.isEditing
          ? await subcategoryRepository.update(state.subcategory)
          : await subcategoryRepository.create(state.subcategory);
    }

    emit(
      state.copyWith(
        isSaving: false,
        showErrorMessages: true,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
