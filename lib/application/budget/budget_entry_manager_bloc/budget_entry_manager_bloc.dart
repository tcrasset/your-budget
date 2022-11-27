import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/application/budget/budget_entry.dart';
import 'package:your_budget/application/core/budget_date_cubit.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_repository.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/errors.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_repository.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';

part 'budget_entry_manager_event.dart';
part 'budget_entry_manager_state.dart';
part 'budget_entry_manager_bloc.freezed.dart';

class BudgetEntryManagerBloc extends Bloc<BudgetEntryManagerEvent, BudgetEntryManagerState> {
  final IBudgetValueRepository budgetvalueRepository;
  final BudgetDateCubit budgetDateCubit;
  Map<UniqueId, BudgetEntry> budgetentries = {};

  BudgetEntryManagerBloc({required this.budgetvalueRepository, required this.budgetDateCubit})
      : super(BudgetEntryManagerState._initial()) {
    on<_Initialized>((event, emit) => emit(state));
    on<_BudgetedChanged>(_onBudgetedChanged);
  }

  void _onBudgetedChanged(_BudgetedChanged event, Emitter<BudgetEntryManagerState> emit) {
    final BudgetEntry entry = event.entry;

    final newBudgetValue = BudgetValue(
      id: entry.id,
      subcategoryId: entry.subcategoryId,
      budgeted: Amount(event.budgeted),
      available: entry.available,
      date: entry.date,
    );

    budgetvalueRepository.update(newBudgetValue);

    emit(state.copyWith(wasModified: true));
    emit(state.copyWith(wasModified: false));
  }
}
