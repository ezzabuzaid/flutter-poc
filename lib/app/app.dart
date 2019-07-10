import 'package:flutter/material.dart';
import 'package:learning_flutter/app/layout/index.dart';
import 'package:learning_flutter/app/partials/notification.dart';
import 'package:learning_flutter/app/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return new MaterialApp(
      title: 'Learning flutter',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
        fontFamily: 'ChakraPetch'
      ),
      supportedLocales: [const Locale('en'), const Locale('ar')],
      routes: routes,
      // initialRoute: '/',
      home: Scaffold(
        body: PushNotification(child: Text('push')),
        appBar: Toolbar('Home'),
        drawer: (Navigation()),
      ),
    );
  }
}
