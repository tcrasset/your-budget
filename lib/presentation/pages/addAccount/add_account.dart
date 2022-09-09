// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/application/addAccount/account_creator/account_creator_bloc.dart';
import 'package:your_budget/application/addAccount/account_watcher_bloc/account_watcher_bloc.dart';
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_repository.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_repository.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import 'package:your_budget/presentation/pages/addAccount/components/account_balance.dart';
import 'package:your_budget/presentation/pages/addAccount/components/account_name.dart';
import 'package:your_budget/presentation/pages/addAccount/components/account_row.dart';

class AddAccountPage extends StatelessWidget {
  final String? title;

  const AddAccountPage({Key? key, this.title}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AccountWatcherBloc>(
          create: (context) =>
              AccountWatcherBloc(accountRepository: GetIt.instance<IAccountRepository>())
                ..add(const AccountWatcherEvent.watchAccountsStarted()),
        ),
        BlocProvider<AccountCreatorBloc>(
          create: (_) => AccountCreatorBloc(
            accountRepository: GetIt.instance<IAccountRepository>(),
            transactionRepository: GetIt.instance<ITransactionRepository>(),
            subcategoryRepository: GetIt.instance<ISubcategoryRepository>(),
            payeeRepository: GetIt.instance<IPayeeRepository>(),
          )..add(const AccountCreatorEvent.initialized()),
        ),
      ],
      child: AddAccountPageScaffold(),
    );
  }
}

class AddAccountPageScaffold extends StatelessWidget {
  final TextStyle _textBoxStyle = const TextStyle(fontSize: 25);

  final InputDecoration _textBoxDecoration = InputDecoration(
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new account"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AddAccountForm(textBoxStyle: _textBoxStyle, textBoxDecoration: _textBoxDecoration),
            SizedBox(height: 200, child: AccountList()),
          ],
        ),
      ),
    );
  }
}

class AddAccountForm extends StatelessWidget {
  const AddAccountForm({
    Key? key,
    required TextStyle textBoxStyle,
    required InputDecoration textBoxDecoration,
  })  : _textBoxStyle = textBoxStyle,
        _textBoxDecoration = textBoxDecoration,
        super(key: key);

  final TextStyle _textBoxStyle;
  final InputDecoration _textBoxDecoration;

  Future<void> handleSubmitForm(BuildContext context) async {
    print("Add account button clicked.");
    context.read<AccountCreatorBloc>().add(const AccountCreatorEvent.saved());
  }

  Future? showErrorFlushbar(ValueFailure failure, BuildContext context) {
    return null;
    // return FlushbarHelper.createError(
    //   message: failure.maybeMap(
    //     unexpected: (_) => 'Unexpected error occured, please contact support.',
    //     uniqueName: (_) => 'You must chose an unique account name.',
    //     orElse: (() => null) as String Function(),
    //   ),
    // ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCreatorBloc, AccountCreatorState>(
      listenWhen: (p, c) => p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
      listener: (context, state) {
        state.saveFailureOrSuccessOption.fold(
          () /*None*/ {},
          (failureOrSuccess) /* Some*/ => failureOrSuccess.fold(
            (failure) => showErrorFlushbar(failure, context),
            (_) /*Success*/ => context
                .read<AccountWatcherBloc>()
                .add(const AccountWatcherEvent.watchAccountsStarted()),
          ),
        );
      },
      buildWhen: (p, c) => p.isSaving != c.isSaving,
      builder: (context, state) {
        return Form(
          autovalidateMode:
              state.showErrorMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Column(
            children: <Widget>[
              AccountName(textStyle: _textBoxStyle, boxDecoration: _textBoxDecoration),
              AccountBalance(textStyle: _textBoxStyle, boxDecoration: _textBoxDecoration),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  key: const Key('addAccountButton'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () => handleSubmitForm(context),
                  child: const Text(
                    'Add account',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AccountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountWatcherBloc, AccountWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          loadSuccess: (newState) {
            final accounts = newState.accounts;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: accounts.length,
                itemBuilder: (BuildContext context, int index) {
                  return AccountRow(account: accounts[index]);
                },
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
