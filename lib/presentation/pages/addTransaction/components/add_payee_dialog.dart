// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/payee_creator/payee_creator_bloc.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_repository.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/payee_field.dart';

Future<String> addPayeeDialog({@required BuildContext context, String defaultValue}) {
  return showDialog(
    context: context,
    builder: (context) {
      return PayeeNameForm(defaultValue: defaultValue);
    },
  );
}

class PayeeNameForm extends HookWidget {
  final String defaultValue;
  const PayeeNameForm({
    Key key,
    @required this.defaultValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = useTextEditingController();
    _textController.text = _nameIsValid(defaultValue) ? defaultValue : "";

    return BlocProvider(
      create: (context) => PayeeCreatorBloc(payeeRepository: GetIt.instance<IPayeeRepository>())
        ..add(PayeeCreatorEvent.initialized(optionOf(_getDefaultName(defaultValue)))),
      child: BlocConsumer<PayeeCreatorBloc, PayeeCreatorState>(
        listenWhen: (p, c) => p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(
            () /*None*/ {},
            (failureOrSuccess) /* Some*/ => failureOrSuccess.fold(
              (failure) => showErrorFlushbar(failure, context),
              (_) /*Success*/ {
                // Reload the whole page
                Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(pageBuilder: (_, __, ___) => PayeeListScaffold()),
                    (_) => false);
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
                controller: _textController,
                validator: (_) => validateName(context),
                onChanged: (value) => onNameChange(context, value),
              ),
            ),
            actions: <Widget>[
              FlatButton(
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

bool _nameIsValid(String defaultValue) => defaultValue != null && defaultValue.trim() != "";

Name _getDefaultName(String defaultValue) {
  if (_nameIsValid(defaultValue)) {
    return Name(defaultValue);
  }
  return null;
}

void handleSubmit(BuildContext context) =>
    context.read<PayeeCreatorBloc>().add(const PayeeCreatorEvent.saved());

void onNameChange(BuildContext context, String value) {
  context.read<PayeeCreatorBloc>().add(PayeeCreatorEvent.nameChanged(
        value,
      ));
}

String _failNameClosure(dynamic f) {
  final result = f.maybeMap(
    longName: (_) => "Must be smaller than ${Name.maxLength}",
    emptyName: (_) => "Must not be empty",
    orElse: () => null,
  );

  return result is String ? result : null;
}

String validateName(BuildContext context) {
  return context.read<PayeeCreatorBloc>().state.payee.name.value.fold(
        (f) => _failNameClosure(f),
        (_) => null,
      );
}

Future showErrorFlushbar(ValueFailure failure, BuildContext context) {
  return FlushbarHelper.createError(
    message: failure.maybeMap(
      unexpected: (_) => 'Unexpected error occured, please contact support.',
      uniqueName: (_) => 'You must chose an unique account name.',
      orElse: () => null,
    ),
  ).show(context);
}
