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

part 'payee_handler_event.dart';
part 'payee_handler_state.dart';
part 'payee_handler_bloc.freezed.dart';

class PayeeHandlerBloc extends Bloc<PayeeHandlerEvent, PayeeHandlerState> {
  final IPayeeRepository payeeRepository;

  PayeeHandlerBloc({@required this.payeeRepository}) : super(const PayeeHandlerState.initial());

  StreamSubscription<List<Payee>> _payeeStreamSubscription;

  @override
  Stream<PayeeHandlerState> mapEventToState(
    PayeeHandlerEvent event,
  ) async* {
    yield* event.map(watchPayeesStarted: (e) async* {
      yield const PayeeHandlerState.loading();
      await _payeeStreamSubscription?.cancel();

      payeeRepository.watchAllPayees().listen(
            (failureOrPayees) => add(PayeeHandlerEvent.payeesReceived(failureOrPayees)),
          );
    }, payeesReceived: (e) async* {
      yield e.failureOrPayees.fold(
        (f) => PayeeHandlerState.loadFailure(f),
        (payees) => PayeeHandlerState.loadSuccess(payees),
      );
    });
  }
}
