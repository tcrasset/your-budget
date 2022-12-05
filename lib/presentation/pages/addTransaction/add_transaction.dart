// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/application/budget/budgetvalue_watcher_bloc/budgetvalue_watcher_bloc.dart';
import 'package:your_budget/application/core/budget_date_cubit.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_repository.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/account_field.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/amount_input_row.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/date_field.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/memo_field.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/payee_field.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/subcategory_field.dart';

class AddTransactionStyles {
  static const TextStyle unselected =
      TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 16.0);
  static const TextStyle selected = TextStyle(color: Colors.black, fontSize: 16.0);
}

class AddTransactionPage extends StatelessWidget {
  void showErrorSnackbar(ValueFailure failure, BuildContext context) {
    final String? message = failure.maybeMap(
      orElse: () => null,
    );

    if (message == null) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message), duration: const Duration(seconds: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionCreatorBloc(
        transactionRepository: GetIt.instance<ITransactionRepository>(),
        budgetValueRepository: GetIt.instance<IBudgetValueRepository>(),
        budgetDateCubit: context.read<BudgetDateCubit>(),
        budgetValueWatcherBloc: context.read<BudgetValueWatcherBloc>(),
      )..add(const TransactionCreatorEvent.initialized()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("New transaction"),
          leading: const Icon(Constants.ADD_TRANSACTION_ICON),
          actions: <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(FontAwesomeIcons.bars),
            ),
          ],
        ),
        body: BlocConsumer<TransactionCreatorBloc, TransactionCreatorState>(
          listenWhen: (p, c) => p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
          listener: (context, state) {
            TransactionCreatorBloc bloc = context.read<TransactionCreatorBloc>();
            state.saveFailureOrSuccessOption.fold(
              () /*None*/ {},
              (failureOrSuccess) /* Some*/ => failureOrSuccess.fold(
                (failure) => showErrorSnackbar(failure, context),
                (_) /*Success*/ {
                  bloc.add(const TransactionCreatorEvent.initialized());
                },
              ),
            );
          },
          buildWhen: (p, c) => p.isSaving != c.isSaving,
          builder: (context, state) {
            return Form(
              autovalidateMode:
                  state.showErrorMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const AmountInputRow(
                            onAmountChange: _onAmountChange,
                            validateAmount: _validateAmount,
                          ),
                        ),
                        const PayeeField(),
                        const AccountField(),
                        const SubcategoryField(),
                        const DateField(),
                        const MemoField(),
                      ],
                    ),
                    FloatingActionButton(
                      onPressed: () => context
                          .read<TransactionCreatorBloc>()
                          .add(const TransactionCreatorEvent.saved()),
                      child: const Text("Enter"),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void _onAmountChange(BuildContext context, String value) =>
    context.read<TransactionCreatorBloc>().add(TransactionCreatorEvent.amountChanged(value));

String? _validateAmount(BuildContext context) {
  final state = context.read<TransactionCreatorBloc>().state;

  // Don't show error messages after a successful save.
  if (state.showErrorMessages == false) {
    return null;
  }

  return state.moneyTransaction.amount.value.fold(
    (f) => _failAmountClosure(f),
    (_) => null,
  );
}

String? _failAmountClosure(ValueFailure f) {
  final result = f.maybeMap(
    tooBigAmount: (_) => "Must be smaller than ${Amount.MAX_VALUE}",
    invalidAmount: (_) => "Please specify an amount.",
    orElse: () => null,
  );

  return result is String ? result : null;
}
