// Flutter imports:
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import '../../../models/constants.dart';
import 'components/account_field.dart';
import 'components/amount_input_row.dart';
import 'components/date_field.dart';
import 'components/memo_field.dart';
import 'components/payee_field.dart';
import 'components/subcategory_field.dart';

class AddTransactionStyles {
  static const TextStyle unselected =
      TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 16.0);
  static const TextStyle selected = TextStyle(color: Colors.black, fontSize: 16.0);
}

class AddTransactionPage extends StatelessWidget {
  Future showErrorFlushbar(ValueFailure failure, BuildContext context) {
    return FlushbarHelper.createError(
      message: failure.maybeMap(
        orElse: (() => null) as String Function(),
      ),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionCreatorBloc(
        transactionRepository: GetIt.instance<ITransactionRepository>(),
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
            state.saveFailureOrSuccessOption.fold(
              () /*None*/ {},
              (failureOrSuccess) /* Some*/ => failureOrSuccess.fold(
                (failure) => showErrorFlushbar(failure, context),
                (_) /*Success*/ {},
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
                              )),
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
                ));
          },
        ),
      ),
    );
  }
}

void _onAmountChange(BuildContext context, String value) =>
    context.read<TransactionCreatorBloc>().add(TransactionCreatorEvent.amountChanged(value));

String? _validateAmount(BuildContext context) =>
    context.read<TransactionCreatorBloc>().state.moneyTransaction.amount.value.fold(
          (f) => _failAccountClosure(f),
          (_) => null,
        );

String? _failAccountClosure(ValueFailure f) {
  final result = f.maybeMap(
    tooBigAmount: (_) => "Must be smaller than ${Amount.maxValue}",
    invalidAmount: (_) => "Amount is invalid. Use only numerical characters.",
    orElse: () => null,
  );

  return result is String ? result : null;
}
