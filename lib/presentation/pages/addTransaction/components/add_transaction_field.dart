// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:

// Project imports:
import 'package:your_budget/presentation/pages/addTransaction/add_transaction.dart';

class AddTransactionField extends StatelessWidget {
  final String name;
  final String defaultValue;
  final String Function(BuildContext) nameGetter;
  final String? Function(BuildContext) validator;
  final Future<void> Function(BuildContext) onTap;

  const AddTransactionField({
    required this.name,
    required this.defaultValue,
    required this.nameGetter,
    required this.onTap,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final value = nameGetter(context);
    return GestureDetector(
      onTap: () => onTap(context), //Tap whole widget, not just textfield
      child: RowContainer(
        name: name,
        childWidget: TextFormField(
          key: Key(value), // hack to rebuild widget if value changes. Can't use controller
          decoration: const InputDecoration.collapsed(hintText: ""),
          style: value == defaultValue
              ? AddTransactionStyles.unselected
              : AddTransactionStyles.selected,
          initialValue: nameGetter(context),
          validator: (_) => validator(context),
          onTap: () => onTap(context),
          enabled: true, // needed to show validation hints
          readOnly: true,
        ),
      ),
    );
  }
}

class RowContainer extends StatelessWidget {
  final String name;

  final Widget childWidget;
  const RowContainer({
    super.key,
    required this.name,
    required this.childWidget,
  });

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
