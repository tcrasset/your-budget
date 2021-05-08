// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import '../../../appstate.dart';
import '../../../models/constants.dart';
import 'components/account_field.dart';
import 'components/amount_input_container.dart';
import 'components/date_field.dart';
import 'components/memo_field.dart';
import 'components/payee_field.dart';
import 'components/subcategory_field.dart';

class AddTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const TextStyle defaultChildTextStyle =
        TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 16.0);
    const TextStyle selectedChildTextStyle = TextStyle(color: Colors.black, fontSize: 16.0);
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
      body: Consumer<AppState>(
        builder: (context, appState, child) {
          if (appState.allCategories.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Form(
                child: BlocProvider(
              create: (context) => TransactionCreatorBloc(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(child: AmountInputContainer()),
                          ],
                        ),
                        const PayeeField(
                            defaultChildTextStyle: defaultChildTextStyle,
                            selectedChildTextStyle: selectedChildTextStyle),
                        const AccountField(
                            defaultChildTextStyle: defaultChildTextStyle,
                            selectedChildTextStyle: selectedChildTextStyle),
                        const SubcategoryField(
                            defaultChildTextStyle: defaultChildTextStyle,
                            selectedChildTextStyle: selectedChildTextStyle),
                        const DateField(selectedChildTextStyle: selectedChildTextStyle),
                        const MemoField(),
                      ],
                    ),
                    // TODO: Error message
                    FloatingActionButton(
                      onPressed: () => null /* state.addMoneyTransaction(context)*/,
                      child: const Text("Enter"),
                    )
                  ],
                ),
              ),
            ));
          }
        },
      ),
    );
  }
}
