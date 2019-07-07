import 'package:flutter/material.dart';
import 'package:learning_flutter/layout/index.dart';
import 'package:learning_flutter/pages/meals/meal.service.dart';
import 'package:learning_flutter/pages/portal/index.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key) {
    MealsService().fetchMeals().then((onValue) {}).catchError((a) {});
  }
  @override
  Widget build(BuildContext ctx) {
    return new MaterialApp(
        title: 'Learning flutter',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          brightness: Brightness.light,
        ),
        home: Scaffold(
          appBar: Toolbar('Home'),
          body: LoginView(),
          drawer: Navigation(),
        ));
  }
}
