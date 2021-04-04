// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../components/row_container.dart';

class MemoField extends StatelessWidget {
  final state; //_AddTransactionPageController

  const MemoField({Key key, @required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rowContainer(
      "Memo",
      TextField(
        decoration: const InputDecoration(hintText: "Add a memo"),
        controller: state.memoController as TextEditingController,
      ),
    );
  }
}
