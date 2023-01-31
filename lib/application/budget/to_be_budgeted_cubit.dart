import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:your_budget/domain/budget/to_be_budgeted_repository.dart';
import 'package:your_budget/domain/constants/i_constants_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/models/utils.dart';

class ToBeBudgetedCubit extends Cubit<Amount> {
  ToBeBudgetedRepository toBeBudgetedRepository;

  ToBeBudgetedCubit({
    required Amount initialAmount,
    required this.toBeBudgetedRepository,
  }) : super(initialAmount);

  Future<void> update() async {
    Amount newAmount =
        (await toBeBudgetedRepository.getToBeBudgeted()).getOrElse(() => Amount.fromDouble(0));
    emit(newAmount + Amount.fromDouble(Random().nextInt(25).toDouble()));
  }
}
