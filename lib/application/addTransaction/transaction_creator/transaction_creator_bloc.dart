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
  }) : super(TransactionCreatorState.initial()) {
    on<_Initialized>((event, emit) => emit(TransactionCreatorState.initial()));
    on<_AmountChanged>(_onAmountChanged);
    on<_AccountChanged>(_onAccountChanged);
    on<_PayeeChanged>(_onPayeeChanged);
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
      moneyTransaction: state.moneyTransaction.copyWith(account: event.account),
      saveFailureOrSuccessOption: none(),
    );
    emit(newState);
  }

  void _onPayeeChanged(_PayeeChanged event, Emitter<TransactionCreatorState> emit) {
    final newState = state.copyWith(
      moneyTransaction: state.moneyTransaction.copyWith(payee: event.payee),
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
    Either<ValueFailure, Unit>? failureOrSuccess;
    emit(state.copyWith(isSaving: true));

    if (state.moneyTransaction.failureOption.isNone()) {
      failureOrSuccess = await transactionRepository.create(state.moneyTransaction);
    }

    final newState = state.copyWith(
      isSaving: false,
      showErrorMessages: true,
      saveFailureOrSuccessOption: optionOf(failureOrSuccess),
    );

    emit(newState);
  }
}
