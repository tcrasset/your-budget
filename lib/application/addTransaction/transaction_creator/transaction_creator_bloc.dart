// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/models/categories.dart';

part 'transaction_creator_event.dart';
part 'transaction_creator_state.dart';
part 'transaction_creator_bloc.freezed.dart';

class TransactionCreatorBloc extends Bloc<TransactionCreatorEvent, TransactionCreatorState> {
  TransactionCreatorBloc() : super(TransactionCreatorState.initial());

  @override
  Stream<TransactionCreatorState> mapEventToState(
    TransactionCreatorEvent event,
  ) async* {
    yield* event.map(
      dateChanged: (e) async* {
        yield state;
      },
      initialized: (e) async* {
        yield state;
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
        yield state;
      },
      saved: (e) async* {
        yield state;
      },
      subcategoryChanged: (e) async* {
        yield state;
      },
      accountChanged: (e) async* {
        yield state;
      },
    );
  }
}
