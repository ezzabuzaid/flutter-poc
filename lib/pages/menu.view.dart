import 'package:flutter/material.dart';
import 'package:learning_flutter/pages/menu.controller.dart';
import 'package:learning_flutter/layout/navigation.dart';
import 'package:learning_flutter/layout/toolbar.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  MenuManager list;
  @override
  void initState() {
    this.list = new MenuManager(['Snacks', 'Chinese']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar('Menu'),
      body: Center(
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: list.populate(),
            ),
          ),
          // ),
        ),
      ),
      drawer: Navigation(),
    );
  }
}

class MenuManager {
  MenuManager(this.names);
  final List<String> names;
  List<Widget> populate() {
    return this.names.map((name) => MenuCard(name: name)).toList();
  }

  void add(String name) {
    this.names.add(name);
  }
}
