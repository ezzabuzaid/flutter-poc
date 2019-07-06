import 'package:flutter/material.dart';
import 'package:learning_flutter/pages/meals/index.dart';

import 'layout/navigation.dart';
import 'layout/toolbar.dart';
import 'pages/portal/index.dart';

void main() {
  runApp(new App());
}

class App extends StatelessWidget {
  App({Key key}) : super(key: key) {
    MealsService().fetchMeals().then((onValue) {
      print('onValue$onValue');
    }).catchError((a) {
      print('error $a');
    });
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
          body: LoginPage(),
          drawer: Navigation(),
        ));
  }
}
