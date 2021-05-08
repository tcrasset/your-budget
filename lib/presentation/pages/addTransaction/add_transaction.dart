// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import '../../../models/constants.dart';
import 'components/account_field.dart';
import 'components/amount_input_container.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Form(
          child: BlocProvider(
            create: (context) => TransactionCreatorBloc(
              transactionRepository: GetIt.instance<ITransactionRepository>(),
            )..add(const TransactionCreatorEvent.initialized()),
            child: BlocBuilder<TransactionCreatorBloc, TransactionCreatorState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const AmountInputContainer(),
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
                );
              },
            ),
          ),
        ));
  }
}
