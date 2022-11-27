import 'package:bloc/bloc.dart';

class BudgetDateCubit extends Cubit<DateTime> {
  BudgetDateCubit() : super(DateTime.now());

  void increment() {
    // ignore: avoid_redundant_argument_values
    if (state.month == DateTime.december) emit(DateTime(state.year + 1, DateTime.january));
    emit(DateTime(state.year, state.month + 1));
  }

  void decrement() {
    if (state.month == DateTime.january) emit(DateTime(state.year - 1, DateTime.december));
    emit(DateTime(state.year, state.month - 1));
  }
}
