// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';
import 'package:your_budget/domain/payee/payee.dart';

part 'payee_watcher_event.dart';
part 'payee_watcher_state.dart';
part 'payee_watcher_bloc.freezed.dart';

class PayeeWatcherBloc extends Bloc<PayeeWatcherEvent, PayeeWatcherState> {
  final IPayeeProvider payeeProvider;
  StreamSubscription<List<Payee>>? _payeeStreamSubscription;

  PayeeWatcherBloc({required this.payeeProvider}) : super(const PayeeWatcherState.initial()) {
    on<_PayeeWatchStarted>(_onPayeeWatchStarted);
    on<_PayeesReceived>(_onPayeesReceived);
  }

  Future<void> _onPayeeWatchStarted(
    _PayeeWatchStarted event,
    Emitter<PayeeWatcherState> emit,
  ) async {
    emit(const PayeeWatcherState.loading());

    await _payeeStreamSubscription?.cancel();

    payeeProvider.watchAllPayees().listen(
          (failureOrPayees) => add(PayeeWatcherEvent.payeesReceived(failureOrPayees)),
        );
  }

  void _onPayeesReceived(_PayeesReceived event, Emitter<PayeeWatcherState> emit) {
    final newState = event.failureOrPayees.fold(
      (f) => PayeeWatcherState.loadFailure(f),
      (payees) {
        payees.sort((a, b) => a.name.getOrCrash().compareTo(b.name.getOrCrash()));
        return PayeeWatcherState.loadSuccess(payees);
      },
    );

    emit(newState);
  }
}
