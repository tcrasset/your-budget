// Flutter imports:
// Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
// Project imports:
import 'package:your_budget/application/budget/subcategory_creator_bloc/subcategory_creator_bloc.dart';
import 'package:your_budget/domain/budget/subcategory_repository.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';

Future<String?> addSubcategoryDialog({required BuildContext superContext, String? defaultValue}) {
  return showDialog(
    context: superContext,
    builder: (_) => const SubcategoryNameForm(),
  );
}

class SubcategoryNameForm extends HookWidget {
  const SubcategoryNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = useTextEditingController();

    return BlocProvider<SubcategoryCreatorBloc>(
      create: (context) =>
          SubcategoryCreatorBloc(subcategoryRepository: context.read<SubcategoryRepository>())
            ..add(const SubcategoryCreatorEvent.initialized()),
      child: BlocConsumer<SubcategoryCreatorBloc, SubcategoryCreatorState>(
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
          return AlertDialog(
            title: const Text("Add new subcategory"),
            content: Form(
              autovalidateMode:
                  state.showErrorMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter new name",
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

void handleSubmit(BuildContext context) =>
    context.read<SubcategoryCreatorBloc>().add(const SubcategoryCreatorEvent.saved());

void onNameChange(BuildContext context, String value) {
  context.read<SubcategoryCreatorBloc>().add(
        SubcategoryCreatorEvent.nameChanged(
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
  return context.read<SubcategoryCreatorBloc>().state.subcategory.name.value.fold(
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
    uniqueName: (_) => 'You must chose an subcategory account name.',
    orElse: () => null,
  );

  if (message == null) return null;

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
