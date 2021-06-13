// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_repository.dart';
import 'package:your_budget/domain/payee/payee.dart';

part 'payee_creator_event.dart';
part 'payee_creator_state.dart';
part 'payee_creator_bloc.freezed.dart';

class PayeeCreatorBloc extends Bloc<PayeeCreatorEvent, PayeeCreatorState> {
  final IPayeeRepository payeeRepository;
  PayeeCreatorBloc({required this.payeeRepository}) : super(PayeeCreatorState.initial());

  @override
  Stream<PayeeCreatorState> mapEventToState(
    PayeeCreatorEvent event,
  ) async* {
    yield* event.map(
      initialized: (e) async* {
        yield e.initialNameOption.fold(
          () => /*No initial name*/ state,
          ((initialName) => state.copyWith(payee: state.payee.copyWith(name: initialName))) as PayeeCreatorState Function(Name),
        );
      },
      nameChanged: (e) async* {
        if (e != null) {
          yield state.copyWith(
            payee: state.payee.copyWith(name: Name(e.name)),
            saveFailureOrSuccessOption: none(),
          );
        }
      },
      saved: (e) async* {
        Either<ValueFailure, Unit>? failureOrSuccess;

        yield state.copyWith(isSaving: true);

        if (state.payee.failureOption.isNone()) {
          // failureOrSuccess = state.isEditing
          //     ? await payeeRepository.update(state.payee)
          //     : await payeeRepository.create(state.payee);
          failureOrSuccess = await payeeRepository.create(state.payee);
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
