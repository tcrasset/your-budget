// Dart imports:
import 'dart:async';

// Flutter imports:

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/account_repository.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'account_creator_event.dart';
part 'account_creator_state.dart';
part 'account_creator_bloc.freezed.dart';

class AccountCreatorBloc extends Bloc<AccountCreatorEvent, AccountCreatorState> {
  final AccountRepository accountRepository;
  AccountCreatorBloc({
    required this.accountRepository,
  }) : super(AccountCreatorState.initial()) {
    on<_Initialized>((event, emit) => emit(AccountCreatorState.initial()));
    on<_NameChanged>(_onNameChanged);
    on<_BalanceChanged>(_onBalanceChanged);
    on<_Saved>(_onSaved);
  }

  void _onBalanceChanged(_BalanceChanged event, Emitter<AccountCreatorState> emit) => emit(
        state.copyWith(
          account: state.account.copyWith(balance: Amount(event.balance)),
          saveFailureOrSuccessOption: none(),
        ),
      );

  void _onNameChanged(_NameChanged event, Emitter<AccountCreatorState> emit) => emit(
        state.copyWith(
          account: state.account.copyWith(name: Name(event.name)),
          saveFailureOrSuccessOption: none(),
        ),
      );

  Future<void> _onSaved(_Saved event, Emitter<AccountCreatorState> emit) async {
    Either<ValueFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(isSaving: true));

    if (state.account.failureOption.isNone()) {
      // failureOrSuccess = state.isEditing
      //     ? await accountRepository.update(state.account)
      //     : await accountRepository.create(state.account);
      failureOrSuccess = await accountRepository.createAccount(state.account);
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
