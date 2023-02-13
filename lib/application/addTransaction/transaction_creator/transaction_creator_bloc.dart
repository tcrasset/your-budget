// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/application/core/budget_date_cubit.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/domain/transaction/transaction_repository.dart';
import 'package:your_budget/models/constants.dart';

part 'transaction_creator_event.dart';
part 'transaction_creator_state.dart';
part 'transaction_creator_bloc.freezed.dart';

class TransactionCreatorBloc extends Bloc<TransactionCreatorEvent, TransactionCreatorState> {
  final TransactionRepository transactionRepository;

  TransactionCreatorBloc({
    required this.transactionRepository,
  }) : super(TransactionCreatorState.initial()) {
    on<_Initialized>((event, emit) => emit(TransactionCreatorState.initial()));
    on<_AmountChanged>(_onAmountChanged);
    on<_AccountChanged>(_onAccountChanged);
    on<_ReceiverChanged>(_onReceiverChanged);
    on<_DateChanged>(_onDateChanged);
    on<_SubcategoryChanged>(_onSubcategoryChanged);
    on<_MemoChanged>(_onMemoChanged);
    on<_Saved>(_onSaved);
  }

  void _onAmountChanged(_AmountChanged event, Emitter<TransactionCreatorState> emit) {
    final newState = state.copyWith(
      moneyTransaction: state.moneyTransaction.copyWith(amount: Amount(event.amount)),
      saveFailureOrSuccessOption: none(),
    );
    emit(newState);
  }

  void _onAccountChanged(_AccountChanged event, Emitter<TransactionCreatorState> emit) {
    final newState = state.copyWith(
      moneyTransaction: state.moneyTransaction.copyWith(giver: right(event.account)),
      saveFailureOrSuccessOption: none(),
    );
    emit(newState);
  }

  void _onReceiverChanged(_ReceiverChanged event, Emitter<TransactionCreatorState> emit) {
    final newState = state.copyWith(
      moneyTransaction: state.moneyTransaction.copyWith(receiver: event.payable),
      saveFailureOrSuccessOption: none(),
    );
    emit(newState);
  }

  void _onDateChanged(_DateChanged event, Emitter<TransactionCreatorState> emit) {
    final newState = state.copyWith(
      moneyTransaction: state.moneyTransaction.copyWith(date: event.date),
      saveFailureOrSuccessOption: none(),
    );
    emit(newState);
  }

  void _onSubcategoryChanged(_SubcategoryChanged event, Emitter<TransactionCreatorState> emit) {
    final newState = state.copyWith(
      moneyTransaction: state.moneyTransaction.copyWith(subcategory: event.subcategory),
      saveFailureOrSuccessOption: none(),
    );
    emit(newState);
  }

  void _onMemoChanged(_MemoChanged event, Emitter<TransactionCreatorState> emit) {
    final newState = state.copyWith(
      moneyTransaction: state.moneyTransaction.copyWith(memo: Name(event.memo)),
      saveFailureOrSuccessOption: none(),
    );
    emit(newState);
  }

  Future<void> _onSaved(_Saved event, Emitter<TransactionCreatorState> emit) async {
    emit(state.copyWith(isSaving: true));

    final newState = state.copyWith(
      isSaving: false,
      showErrorMessages: true,
    );

    final finalState = await validateTransaction(state.moneyTransaction).fold(
      (failure) async => newState.copyWith(
        saveFailureOrSuccessOption: optionOf(
          left(failure),
        ),
      ),
      (transaction) async => newState.copyWith(
        saveFailureOrSuccessOption: optionOf(
          await transactionRepository.createTransaction(transaction),
        ),
      ),
    );

    emit(finalState);
    // Re-emit state with no failure so that another press on 'Enter'
    // will re-show the error.
    emit(finalState.copyWith(saveFailureOrSuccessOption: none()));
    return;
  }
}

Either<ValueFailure, MoneyTransaction> validateTransaction(MoneyTransaction transaction) {
  if (transaction.failureOption.isSome()) {
    left(transaction.failureOption as ValueFailure);
  }

  return transaction.failureOption.fold(
    () {
      late MoneyTransaction validatedTransaction = transaction;
      final receiver = transaction.receiver;
      final giver = transaction.giver;
      final type = transaction.type;

      final MoneyTransactionType newType = getType(transaction);

      validatedTransaction = transaction.copyWith(
        type: newType,
      );

      if (newType == MoneyTransactionType.toBeBudgeted) {
        // We swap giver and receiver
        validatedTransaction = validatedTransaction.copyWith(
          receiver: giver,
          giver: receiver,
        );
      }

      return right(validatedTransaction);
    },
    (a) => left(a),
  );
}

MoneyTransactionType getType(MoneyTransaction transaction) {
  final subcategory = transaction.subcategory;
  final isToBeBudgeted = subcategory!.name.getOrCrash() == DatabaseConstants.TO_BE_BUDGETED;
  if (isToBeBudgeted) {
    return MoneyTransactionType.toBeBudgeted;
  }
  final bool isAccount = transaction.receiver.isRight();

  return isAccount ? MoneyTransactionType.betweenAccount : MoneyTransactionType.subcategory;
}
