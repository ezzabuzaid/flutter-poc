import 'package:flutter/material.dart';
import 'package:learning_flutter/layout/navigation.dart';
import 'package:learning_flutter/layout/toolbar.dart';
import 'package:learning_flutter/pages/portal/portal.dart';

void main() => runApp(new App());

class _App extends State<App> {
  @override
  Widget build(BuildContext ctx) {
    return new MaterialApp(
        title: 'Learning flutter',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          brightness: Brightness.dark,
        ),
        home: Scaffold(
          appBar: Toolbar('Home'),
          body: LoginPage(),
          drawer: Navigation(),
        ));
  }
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key) {
    print('[App] Called');
  }
  @override
  _App createState() => _App();
}
