import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:provider/provider.dart';

class AddCategoryRoute extends StatefulWidget {
  @override
  _AddCategoryRouteController createState() => _AddCategoryRouteController();
}

class _AddCategoryRouteController extends State<AddCategoryRoute> {
  AppState appState;
  final _catFormKey = GlobalKey<FormState>(); //FormCheck
  final myCatController = TextEditingController();

  @override
  void initState() {
    appState = Provider.of<AppState>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    myCatController.dispose();
    super.dispose();
  }

  void handleAddCategoryAndPopContext(BuildContext context) async {
    if (_catFormKey.currentState.validate()) {
      // If form is valid, add subcategory to the database and add it to the state
      appState.addCategory(myCatController.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) => _AddCategoryRouteView(this);
}

class _AddCategoryRouteView extends WidgetView<AddCategoryRoute, _AddCategoryRouteController> {
  _AddCategoryRouteView(_AddCategoryRouteController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add a new category"),
        ),
        body: Column(
          children: <Widget>[
            Form(
                key: state._catFormKey,
                child: Column(
                  children: <Widget>[
                    Text("Add category"),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: state.myCatController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () => state.handleAddCategoryAndPopContext(context),
                        child: Text('Add category ${state.myCatController.text}'),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
