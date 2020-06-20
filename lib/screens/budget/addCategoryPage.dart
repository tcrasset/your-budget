import 'package:flutter/material.dart';
import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/components/widgetViewClasses.dart';

class AddCategoryRoute extends StatefulWidget {
  @override
  _AddCategoryRouteController createState() => _AddCategoryRouteController();
}

class _AddCategoryRouteController extends State<AddCategoryRoute> {
  final _catFormKey = GlobalKey<FormState>(); //FormCheck
  final myCatController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myCatController.dispose();
    super.dispose();
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
                        onPressed: () async {
                          // Check that the form is valid
                          if (state._catFormKey.currentState.validate()) {
                            int catCount = await SQLQueryClass.categoryCount();
                            MainCategory category =
                                MainCategory(catCount, state.myCatController.text);
                            SQLQueryClass.addCategory(category);
                            Navigator.pop(context, '${state.myCatController.text}');
                          }
                        },
                        child: Text('Add category ${state.myCatController.text}'),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
