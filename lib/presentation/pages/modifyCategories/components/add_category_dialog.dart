// Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
// Project imports:
import 'package:your_budget/application/budget/category_creator_bloc/category_creator_bloc.dart';
import 'package:your_budget/domain/category/i_category_provider.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';

Future<String?> addCategoryDialog({required BuildContext superContext, String? defaultValue}) {
  return showDialog(
    context: superContext,
    builder: (_) => const CategoryNameForm(),
  );
}

class CategoryNameForm extends HookWidget {
  const CategoryNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = useTextEditingController();

    return BlocProvider<CategoryCreatorBloc>(
      create: (context) =>
          CategoryCreatorBloc(categoryProvider: GetIt.instance<ICategoryProvider>())
            ..add(const CategoryCreatorEvent.initialized()),
      child: BlocConsumer<CategoryCreatorBloc, CategoryCreatorState>(
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
            title: const Text("Add new category"),
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
    context.read<CategoryCreatorBloc>().add(const CategoryCreatorEvent.saved());

void onNameChange(BuildContext context, String value) {
  context.read<CategoryCreatorBloc>().add(
        CategoryCreatorEvent.nameChanged(
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
  return context.read<CategoryCreatorBloc>().state.category.name.value.fold(
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
    uniqueName: (_) => 'You must chose an unique category name.',
    orElse: () => null,
  );

  if (message == null) return null;

  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message), duration: const Duration(seconds: 1)));
}
