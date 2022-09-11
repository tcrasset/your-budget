// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:your_budget/presentation/pages/addTransaction/add_transaction.dart';

import '../../../../application/addTransaction/transaction_creator/transaction_creator_bloc.dart';

class AddTransactionField extends HookWidget {
  final String name;
  final String Function(BuildContext) nameGetter;
  final Future<void> Function(BuildContext) onTap;

  const AddTransactionField({
    required this.name,
    required this.nameGetter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context), //Tap whole widget, not just textfield
      child: RowContainer(name: name, childWidget: Text(nameGetter(context))),
    );
  }
}

class RowContainer extends StatelessWidget {
  final String name;

  final Widget childWidget;
  const RowContainer({
    Key? key,
    required this.name,
    required this.childWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(child: childWidget),
                    if (name == "Date") const Icon(Icons.date_range) else const Icon(Icons.edit),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
