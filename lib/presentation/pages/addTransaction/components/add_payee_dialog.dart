// Flutter imports:
// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
// Project imports:
import 'package:your_budget/application/addTransaction/payee_creator/payee_creator_bloc.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';

Future<String?> addPayeeDialog({required BuildContext superContext, String? defaultValue}) {
  return showDialog(
    context: superContext,
    builder: (_) => PayeeNameForm(defaultValue: defaultValue!),
  );
}

class PayeeNameForm extends HookWidget {
  final String /*!*/ defaultValue;
  const PayeeNameForm({
    super.key,
    required this.defaultValue,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = useTextEditingController();
    textController.text = _nameIsValid(defaultValue) ? defaultValue : "";

    return BlocProvider<PayeeCreatorBloc>(
      create: (context) => PayeeCreatorBloc(payeeProvider: GetIt.instance<IPayeeProvider>())
        ..add(PayeeCreatorEvent.initialized(optionOf(_getDefaultName(defaultValue)))),
      child: BlocConsumer<PayeeCreatorBloc, PayeeCreatorState>(
        listenWhen: (p, c) => p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(
            () /*None*/ {},
            (failureOrSuccess) /* Some*/ => failureOrSuccess.fold(
              (failure) => showErrorSnackbar(failure, context),
              (_) /*Success*/ {
                Navigator.pop(context); //Temporary fix
              },
            ),
          );
        },
        builder: (context, state) {
          // Set default value

          return AlertDialog(
            title: const Text("Add new payee"),
            content: Form(
              autovalidateMode:
                  state.showErrorMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                controller: textController,
                validator: (_) => validateName(context),
                onChanged: (value) => onNameChange(context, value),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => handleSubmit(context),
                child: const Text("Create"),
              ),
            ],
          );
        },
      ),
    );
  }
}

bool _nameIsValid(String defaultValue) => defaultValue.trim() != "";

Name? _getDefaultName(String defaultValue) {
  if (_nameIsValid(defaultValue)) {
    return Name(defaultValue);
  }
  return null;
}

void handleSubmit(BuildContext context) =>
    context.read<PayeeCreatorBloc>().add(const PayeeCreatorEvent.saved());

void onNameChange(BuildContext context, String value) {
  context.read<PayeeCreatorBloc>().add(
        PayeeCreatorEvent.nameChanged(
          value,
        ),
      );
}

String? _failNameClosure(ValueFailure f) {
  final result = f.maybeMap(
    longName: (_) => "Must be smaller than ${Name.maxLength}",
    emptyName: (_) => "Must not be empty",
    orElse: () => null,
  );

  return result is String ? result : null;
}

String? validateName(BuildContext context) {
  return context.read<PayeeCreatorBloc>().state.payee.name.value.fold(
        (f) => _failNameClosure(f),
        (_) => null,
      );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showErrorSnackbar(
  ValueFailure failure,
  BuildContext context,
) {
  final message = failure.maybeMap(
    unexpected: (_) => 'Unexpected error occurred, please contact support.',
    uniqueName: (_) => 'You must chose an unique account name.',
    orElse: () => null,
  );

  if (message == null) return null;

  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message), duration: const Duration(seconds: 1)));
}
