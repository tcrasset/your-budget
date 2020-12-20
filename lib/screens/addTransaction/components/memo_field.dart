import 'package:flutter/material.dart';

import '../../../components/rowContainer.dart';

class MemoField extends StatelessWidget {
  final state; //_AddTransactionPageController

  const MemoField({Key key, @required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rowContainer(
      "Memo",
      TextField(
        decoration: new InputDecoration(hintText: "Add a memo"),
        controller: state.memoController,
      ),
    );
  }
}
