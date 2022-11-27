import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/application/core/budget_date_cubit.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_repository.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_repository.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';

part 'budget_entry_manager_event.dart';
part 'budget_entry_manager_state.dart';
part 'budget_entry_manager_bloc.freezed.dart';

class BudgetEntryManagerBloc extends Bloc<BudgetEntryManagerEvent, BudgetEntryManagerState> {
  final ISubcategoryRepository subcategoryRepository;
  final IBudgetValueRepository budgetvalueRepository;
  final BudgetDateCubit budgetDateCubit;
  Map<UniqueId, Subcategory> subcategories = {};

  BudgetEntryManagerBloc(
      {required this.subcategoryRepository,
      required this.budgetvalueRepository,
      required this.budgetDateCubit})
      : super(BudgetEntryManagerState._initial()) {
    on<_Initialized>((event, emit) => emit(state));
    on<_NameChanged>(_onNameChanged);
    on<_SubcategoryAdded>(_onSubcategoryAdded);
    on<_BudgetedChanged>(_onBudgetedChanged);
    on<_AvailableChanged>(_onAvailableChanged);
  }

  void setSubcategory(Subcategory subcategory) {
    subcategories[subcategory.id] = subcategory;
  }

  void _onBudgetedChanged(_BudgetedChanged event, Emitter<BudgetEntryManagerState> emit) {
    final Subcategory? newSubcat =
        subcategories[event.id]?.copyWith(budgeted: Amount(event.budgeted));

    if (newSubcat != null) {
      subcategoryRepository.update(newSubcat);
      subcategories[event.id] = newSubcat;
      emit(state.copyWith(wasModified: true));
      emit(state.copyWith(wasModified: false));
    }
  }

  void _onSubcategoryAdded(_SubcategoryAdded event, Emitter<BudgetEntryManagerState> emit) {
    subcategoryRepository.create(event.subcat);
    subcategories[event.subcat.id] = event.subcat;
    emit(state.copyWith(wasModified: true));
    emit(state.copyWith(wasModified: false));
  }

  void _onAvailableChanged(_AvailableChanged event, Emitter<BudgetEntryManagerState> emit) {
    final Subcategory? newSubcat =
        subcategories[event.id]?.copyWith(available: Amount(event.available));

    if (newSubcat != null) {
      subcategoryRepository.update(newSubcat);
      subcategories[event.id] = newSubcat;
      emit(state.copyWith(wasModified: true));
      emit(state.copyWith(wasModified: false));
    }
  }

  void _onNameChanged(_NameChanged event, Emitter<BudgetEntryManagerState> emit) {
    final Subcategory? newSubcat = subcategories[event.id]?.copyWith(name: Name(event.name));
    if (newSubcat != null) {
      subcategoryRepository.update(newSubcat);
      subcategories[event.id] = newSubcat;
      emit(state.copyWith(wasModified: true));
      emit(state.copyWith(wasModified: false));
    }
  }
}
