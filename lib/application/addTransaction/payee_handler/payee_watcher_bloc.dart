// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_repository.dart';
import 'package:your_budget/domain/payee/payee.dart';

part 'payee_watcher_event.dart';
part 'payee_watcher_state.dart';
part 'payee_watcher_bloc.freezed.dart';

class PayeeWatcherBloc extends Bloc<PayeeWatcherEvent, PayeeWatcherState> {
  final IPayeeRepository payeeRepository;

  PayeeWatcherBloc({required this.payeeRepository}) : super(const PayeeWatcherState.initial());

  StreamSubscription<List<Payee>>? _payeeStreamSubscription;

  @override
  Stream<PayeeWatcherState> mapEventToState(
    PayeeWatcherEvent event,
  ) async* {
    yield* event.map(watchPayeesStarted: (e) async* {
      yield const PayeeWatcherState.loading();
      await _payeeStreamSubscription?.cancel();

      payeeRepository.watchAllPayees().listen(
            (failureOrPayees) => add(PayeeWatcherEvent.payeesReceived(failureOrPayees)),
          );
    }, payeesReceived: (e) async* {
      yield e.failureOrPayees.fold(
        (f) => PayeeWatcherState.loadFailure(f),
        (payees) => PayeeWatcherState.loadSuccess(payees),
      );
    });
  }
}
