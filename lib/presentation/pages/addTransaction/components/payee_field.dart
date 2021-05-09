// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/payee_handler/payee_watcher_bloc.dart';
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/domain/payee/i_payee_repository.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/presentation/pages/addTransaction/add_transaction.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/search_field.dart';
import '../../../../components/row_container.dart';
import 'add_payee_dialog.dart';

class PayeeField extends HookWidget {
  const PayeeField({
    Key key,
  }) : super(key: key);

  static const String _DEFAULT_PAYEE = "Select payee";
  Future<void> handleOnTap(BuildContext context) async {
    final Payee payee = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PayeeListScaffold()),
    );
    if (payee != null) {
      context.read<TransactionCreatorBloc>().add(TransactionCreatorEvent.payeeChanged(payee));
    }
  }

  String getPayeeName(BuildContext context) {
    //TODO: Handle errors
    return context
        .watch<TransactionCreatorBloc>()
        .state
        .moneyTransaction
        .payeeName
        .value
        .fold((_) => "Select payee", (v) => v);
  }

  String validatePayee(BuildContext context) =>
      context.read<TransactionCreatorBloc>().state.moneyTransaction.amount.value.fold(
            (f) => f.maybeMap(orElse: () => null),
            (_) => null,
          );

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController();
    controller.text = getPayeeName(context);
    return GestureDetector(
      // Payees gesture detectory leading to 'Payees' SelectValuePage
      onTap: () => handleOnTap(context),
      child: RowContainer(
        name: "Payee",
        childWidget: TextFormField(
          decoration: const InputDecoration.collapsed(hintText: ""),
          style: controller.text == _DEFAULT_PAYEE
              ? AddTransactionStyles.unselected
              : AddTransactionStyles.selected,
          enabled: false,
          readOnly: true,
          validator: (_) => validatePayee(context),
          controller: controller,
        ),
      ),
    );
  }
}

class PayeeListScaffold extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    return MultiBlocProvider(
      providers: [
        BlocProvider<PayeeWatcherBloc>(
          create: (context) => PayeeWatcherBloc(payeeRepository: GetIt.instance<IPayeeRepository>())
            ..add(const PayeeWatcherEvent.watchPayeesStarted()),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Choose a payee"),
        ),
        body: BlocBuilder<PayeeWatcherBloc, PayeeWatcherState>(
          builder: (context, state) {
            return state.maybeMap(
              loadSuccess: (newState) => Column(
                children: [
                  SearchField(searchController: searchController),
                  AddPayeeField(searchController: searchController),
                  Expanded(child: PayeeList(searchController: searchController)),
                ],
              ),
              loadFailure: (_) => const Center(child: Text("Failure.")),
              loading: (_) => const Center(child: CircularProgressIndicator()),
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }
}

class AddPayeeField extends StatelessWidget {
  const AddPayeeField({
    Key key,
    @required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        "Create new payee",
        style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
      ),
      onTap: () => addPayeeDialog(context: context, defaultValue: searchController.text),
    );
  }
}

class PayeeList extends StatelessWidget {
  final TextEditingController searchController;
  const PayeeList({@required this.searchController});

  void _handlePopContext(BuildContext context, Payee payee) => Navigator.of(context).pop(payee);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayeeWatcherBloc, PayeeWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          loadSuccess: (newState) => ListView.separated(
            shrinkWrap: true,
            itemCount: newState.payees.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 1, color: Colors.black12),
            itemBuilder: (BuildContext context, int index) {
              final payee = newState.payees[index];
              final name = payee.name.getOrCrash();
              final bool noFilter = searchController.text == null || searchController.text == "";

              if (noFilter == true) {
                return ListTile(title: Text(name), onTap: () => _handlePopContext(context, payee));
              } else {
                // The filter is not empty, we filter by name
                if (name.toLowerCase().contains(searchController.text.toLowerCase()) == true) {
                  return ListTile(
                      title: Text(name), onTap: () => _handlePopContext(context, payee));
                }
              }
              return Container();
              // There               });
            },
          ),
          orElse: () => Container(),
        );
      },
    );
  }
}
