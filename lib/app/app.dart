import 'package:flutter/material.dart';
import 'package:learning_flutter/app/layout/index.dart';
import 'package:learning_flutter/app/pages/meals/meal.service.dart';
import 'package:learning_flutter/app/routes.dart';

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
        // builder: (s, c) {
        //   return Scaffold();
        // },
        routes: routes,
        home: Scaffold(
          appBar: Toolbar('Home'),
          drawer: Navigation(),
        ));
  }
}
