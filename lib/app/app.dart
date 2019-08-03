import 'package:flutter/material.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/routes.dart';
import 'package:learning_flutter/app/core/constants.dart';
import 'package:learning_flutter/app/pages/portal/index.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return new MaterialApp(
      title: 'Learning flutter',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        brightness: Brightness.light,
        fontFamily: 'DancingScript',
      ),
      supportedLocales: [const Locale('en'), const Locale('ar')],
      routes: routes,
      home: RegisterView(),
    );
  }
}
