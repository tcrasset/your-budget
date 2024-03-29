// Flutter imports:
import 'package:flutter/material.dart';

// https://blog.gskinner.com/archives/2020/02/flutter-widgetview-a-simple-separation-of-layout-and-logic.html

abstract class WidgetView<T1, T2> extends StatelessWidget {
  final T2 state;

  T1 get widget => (state as State).widget as T1;

  const WidgetView(this.state, {super.key});

  @override
  Widget build(BuildContext context);
}

abstract class StatelessView<T1> extends StatelessWidget {
  final T1 widget;

  const StatelessView(this.widget, {super.key});

  @override
  Widget build(BuildContext context);
}
