// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import 'package:your_budget/domain/transaction/transaction.dart';

part 'transaction_creator_event.dart';
part 'transaction_creator_state.dart';
part 'transaction_creator_bloc.freezed.dart';

class TransactionCreatorBloc extends Bloc<TransactionCreatorEvent, TransactionCreatorState> {
  final ITransactionRepository transactionRepository;
  TransactionCreatorBloc({
    required this.transactionRepository,
  }) : super(TransactionCreatorState.initial());

  @override
  Stream<TransactionCreatorState> mapEventToState(
    TransactionCreatorEvent event,
  ) async* {
    yield* event.map(
      initialized: (e) async* {
        yield state;
      },
      amountChanged: (e) async* {
        if (e != null) {
          yield state.copyWith(
            moneyTransaction: state.moneyTransaction.copyWith(amount: Amount(e.amount)),
            saveFailureOrSuccessOption: none(),
          );
        }
      },
      dateChanged: (e) async* {
        if (e != null) {
          yield state.copyWith(
            moneyTransaction: state.moneyTransaction.copyWith(date: e.date),
            saveFailureOrSuccessOption: none(),
          );
        }
      },
      memoChanged: (e) async* {
        if (e != null) {
          yield state.copyWith(
            moneyTransaction: state.moneyTransaction.copyWith(memo: Name(e.memo)),
            saveFailureOrSuccessOption: none(),
          );
        }
      },
      payeeChanged: (e) async* {
        yield state.copyWith(
          moneyTransaction: state.moneyTransaction.copyWith(payeeName: e.payee.name),
          saveFailureOrSuccessOption: none(),
        );
      },
      subcategoryChanged: (e) async* {
        yield state.copyWith(
          moneyTransaction: state.moneyTransaction.copyWith(subcatName: e.subcategory.name),
          saveFailureOrSuccessOption: none(),
        );
      },
      accountChanged: (e) async* {
        yield state.copyWith(
          moneyTransaction: state.moneyTransaction.copyWith(accountName: e.account.name),
          saveFailureOrSuccessOption: none(),
        );
      },
      saved: (e) async* {
        Either<ValueFailure, Unit>? failureOrSuccess;
        yield state.copyWith(isSaving: true);

        if (state.moneyTransaction.failureOption.isNone()) {
          failureOrSuccess = await transactionRepository.create(state.moneyTransaction);
        }

        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
    );
  }
}
