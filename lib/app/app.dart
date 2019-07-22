import 'package:flutter/material.dart';
import 'package:learning_flutter/app/layout/index.dart';
import 'package:learning_flutter/app/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return new MaterialApp(
      title: 'Learning flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
        fontFamily: 'DancingScript'
      ),
      supportedLocales: [const Locale('en'), const Locale('ar')],
      routes: routes,
      // initialRoute: '/',
      home: Scaffold(
        // body: PushNotification(child: Text('push')),
        appBar: Toolbar('Home'),
        drawer: (Navigation()),
      ),
    );
  }
}
