import 'package:flutter/material.dart';

class Toolbar extends AppBar {
  Toolbar(String title)
      : super(
          title: Text(title),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
        );
}
