// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/add_transaction_field.dart';

class MemoField extends HookWidget {
  const MemoField({super.key});

  void onMemoChange(BuildContext context, String value) {
    context.read<TransactionCreatorBloc>().add(
          TransactionCreatorEvent.memoChanged(
            value,
          ),
        );
  }

  String? _failNameClosure(dynamic f) {
    final result = f.maybeMap(
      longName: (_) => "Must be smaller than ${Name.maxLength}",
      emptyName: (_) => "Must not be empty",
      orElse: () => null,
    );

    return result is String ? result : null;
  }

  String? validateMemo(BuildContext context) {
    final state = context.read<TransactionCreatorBloc>().state;

    // Don't show error messages after a successful save.
    if (state.showErrorMessages == false) {
      return null;
    }

    return state.moneyTransaction.memo.value.fold(
      (f) => _failNameClosure(f),
      (_) => null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController();
    return BlocConsumer<TransactionCreatorBloc, TransactionCreatorState>(
      listenWhen: (p, c) => getMemo(p) != getMemo(c),
      listener: (context, state) {
        final String? memo = getMemo(state);
        if (memo == null) {
          // Clear the controller after a successful save.
          controller.clear();
          return;
        }

        controller
          ..text = memo
          ..selection = TextSelection.collapsed(offset: controller.text.length);
      },
      builder: (context, state) {
        return RowContainer(
          name: "Memo",
          childWidget: TextFormField(
            decoration: const InputDecoration(hintText: "Add a memo"),
            controller: controller,
            validator: (_) => validateMemo(context),
            onChanged: (value) => onMemoChange(context, value),
          ),
        );
      },
    );
  }
}

String? getMemo(TransactionCreatorState state) => state.moneyTransaction.memo.value.fold(
      (_) => null,
      (v) => v,
    );
