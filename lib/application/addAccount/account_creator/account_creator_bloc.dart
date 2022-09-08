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
import 'package:your_budget/domain/account/account_creator.dart';
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_repository.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_repository.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';

part 'account_creator_event.dart';
part 'account_creator_state.dart';
part 'account_creator_bloc.freezed.dart';

class AccountCreatorBloc extends Bloc<AccountCreatorEvent, AccountCreatorState> {
  final IAccountRepository accountRepository;
  final ITransactionRepository transactionRepository;
  final ISubcategoryRepository subcategoryRepository;
  final IPayeeRepository payeeRepository;
  AccountCreatorBloc({
    required this.accountRepository,
    required this.transactionRepository,
    required this.subcategoryRepository,
    required this.payeeRepository,
  }) : super(AccountCreatorState.initial()) {
    on<_Initialized>((event, emit) => emit(state));
    on<_NameChanged>((event, emit) => emit(
          state.copyWith(
            account: state.account.copyWith(name: Name(event.name)),
            saveFailureOrSuccessOption: none(),
          ),
        ));
    on<_BalanceChanged>((event, emit) => emit(
          state.copyWith(
            account: state.account.copyWith(balance: Amount(event.balance)),
            saveFailureOrSuccessOption: none(),
          ),
        ));
    on<_Saved>((event, emit) => _onSaved);
  }

  _onSaved(_Saved event, Emitter<AccountCreatorState> emit) async {
    Either<ValueFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(isSaving: true));

    if (state.account.failureOption.isNone()) {
      // failureOrSuccess = state.isEditing
      //     ? await accountRepository.update(state.account)
      //     : await accountRepository.create(state.account);
      failureOrSuccess = await AccountCreator(
        accountRepository: accountRepository,
        transactionRepository: transactionRepository,
        subcategoryRepository: subcategoryRepository,
        payeeRepository: payeeRepository,
      ).create(state.account);
    }

    emit(state.copyWith(
      isSaving: false,
      showErrorMessages: true,
      saveFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
