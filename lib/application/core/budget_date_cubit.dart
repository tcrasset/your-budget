import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:your_budget/domain/constants/i_constants_repository.dart';
import 'package:your_budget/models/utils.dart';

class BudgetDateCubit extends Cubit<DateTime> {
  BudgetDateCubit() : super(getDateFromMonthStart(DateTime.now()));

  void increment() {
    // ignore: avoid_redundant_argument_values
    DateTime newDate;
    final DateTime maxBudgetDate = getMaxBudgetDate();
    if (state.month == DateTime.december) {
      newDate = DateTime(state.year + 1);
    } else {
      newDate = DateTime(state.year, state.month + 1);
    }

    if (newDate.isAfter(maxBudgetDate)) {
      return;
    }

    emit(newDate);
  }

  Future<void> decrement() async {
    DateTime newDate;
    final failureOrDate = await GetIt.instance<IConstantsRepository>().getStartingBudgetDate();

    final minBudgetDate = failureOrDate
        .getOrElse(() => throw Exception("Could not reach database for starting budget date"));
    if (state.month == DateTime.january) {
      newDate = DateTime(state.year - 1, DateTime.december);
    } else {
      newDate = DateTime(state.year, state.month - 1);
    }

    if (newDate.isBefore(minBudgetDate)) {
      return;
    }

    emit(newDate);
  }
}
