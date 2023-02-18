import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_budget/application/showTransactions/transaction_selector_bloc/transaction_selector_bloc.dart';
import 'package:your_budget/domain/transaction/transaction.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    super.key,
    required this.transaction,
  });

  final MoneyTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key(transaction.id.getOrCrash()),
      title: Title(transaction: transaction),
      subtitle: Subtitle(transaction: transaction),
    );
  }
}

class CheckboxTransactionListTile extends StatelessWidget {
  const CheckboxTransactionListTile({
    super.key,
    required this.transaction,
  });

  final MoneyTransaction transaction;

  @override
  Widget build(BuildContext context) {
    // Only rebuild the Widget when the transaction is selected
    final isSelected = context.select<TransactionSelectorBloc, bool>(
      (bloc) => bloc.state.selectedTransactions.contains(transaction),
    );

    return CheckboxListTile(
      onChanged: (_) => context
          .read<TransactionSelectorBloc>()
          .add(TransactionSelectorEvent.toggleSelected(transaction)),
      value: isSelected,
      dense: true,
      selected: isSelected,
      enabled: transaction.type != MoneyTransactionType.initial,
      controlAffinity: ListTileControlAffinity.leading,
      title: Title(transaction: transaction),
      subtitle: Subtitle(transaction: transaction),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.transaction,
  });

  final MoneyTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(transaction.memo.getOrCrash())),
        Expanded(child: Text(transaction.giverName.getOrCrash())),
        Expanded(
          child: transaction.subcategory == null
              ? Text(transaction.receiverName.getOrCrash())
              : Text(transaction.subcategory!.name.getOrCrash()),
        )
      ],
    );
  }
}

class Subtitle extends StatelessWidget {
  const Subtitle({
    super.key,
    required this.transaction,
  });

  final MoneyTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${transaction.amount.getOrCrash()} €'),
        Text(transaction.date.toLocal().toString()),
      ],
    );
  }
}
