// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'account_creator_event.dart';
part 'account_creator_state.dart';
part 'account_creator_bloc.freezed.dart';

class AccountCreatorBloc extends Bloc<AccountCreatorEvent, AccountCreatorState> {
  final IAccountRepository accountRepository;
  AccountCreatorBloc({@required this.accountRepository}) : super(AccountCreatorState.initial());

  @override
  Stream<AccountCreatorState> mapEventToState(
    AccountCreatorEvent event,
  ) async* {
    yield* event.map(
      initialized: (e) async* {
        print("Initialized");
        yield state;
      },
      nameChanged: (e) async* {
        if (e != null) {
          yield state.copyWith(
            account: state.account.copyWith(name: Name(e.name)),
            saveFailureOrSuccessOption: none(),
          );
        }
      },
      balanceChanged: (e) async* {
        if (e != null) {
          yield state.copyWith(
            account: state.account.copyWith(balance: Amount(e.balance)),
            saveFailureOrSuccessOption: none(),
          );
        }
      },
      saved: (e) async* {
        Either<ValueFailure, Unit> failureOrSuccess;

        yield state.copyWith(isSaving: true);

        if (state.account.failureOption.isNone()) {
          // failureOrSuccess = state.isEditing
          //     ? await accountRepository.update(state.account)
          //     : await accountRepository.create(state.account);
          failureOrSuccess = await accountRepository.create(state.account);
        }

        //TODO: Create starting transaction
        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
    );
  }
}
