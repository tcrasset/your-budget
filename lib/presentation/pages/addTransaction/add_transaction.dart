// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';
import 'package:your_budget/domain/payee/payee_repository.dart';
import 'package:your_budget/domain/transaction/transaction_repository.dart';
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

void showErrorSnackbar(ValueFailure failure, BuildContext context) {
  final String? message = failure.maybeMap(
    inflowTransactionNotIntoToBeBudgeted: (_) =>
        "Inflow transaction can only be made between accounts or into 'To Be Budgeted'",
    outflowTransactionFromToBeBudgeted: (_) =>
        "Outflow transactions cannot be made from 'To Be Budgeted'",
    orElse: () => "Unexpected exception. Contact support.",
  );

  if (message == null) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Constants.RED_COLOR,
    ),
  );
}

void showSuccessSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Added transaction!'),
      backgroundColor: Constants.GREEN_COLOR,
    ),
  );
}

class AddTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PayeeRepository(
            payeeProvider: GetIt.instance<IPayeeProvider>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TransactionCreatorBloc(
              transactionRepository: context.read<TransactionRepository>(),
            )..add(const TransactionCreatorEvent.initialized()),
          ),
        ],
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
              final TransactionCreatorBloc bloc = context.read<TransactionCreatorBloc>();
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
                          const ReceiverField(),
                          const GiverField(),
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
      ),
    );
  }
}

void _onAmountChange(BuildContext context, String value) =>
    context.read<TransactionCreatorBloc>().add(TransactionCreatorEvent.amountChanged(value));

String? _validateAmount(BuildContext context) {
  final state = context.read<TransactionCreatorBloc>().state;

  if (state.showErrorMessages == false) {
    // Don't show error messages after a successful save.
    return null;
  }

  return state.moneyTransaction.amount.value.fold(
    (f) => _failAmountClosure(f),
    (_) => null,
  );
}

String? _failAmountClosure(ValueFailure f) => f.maybeMap(
      tooBigAmount: (_) => "Must be smaller than ${Amount.MAX_VALUE}",
      invalidAmount: (_) => "Please specify an amount.",
      orElse: () => null,
    );
