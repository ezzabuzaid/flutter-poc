import 'package:flutter/material.dart';
import 'package:learning_flutter/app/app.dart';

class Toolbar extends AppBar {
  final Widget title;

  final BuildContext context;
  Toolbar({
    title,
    this.context,
  })  : this.title = Text(title),
        super(
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(200, 80, 0, 0),
                  items: [
                    PopupMenuItem(
                      child: RawMaterialButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          ThemeSwitcher.of(context)
                              .switchTheme(Brightness.light);
                        },
                        child: Text("Light theme"),
                      ),
                    ),
                    PopupMenuItem(
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          ThemeSwitcher.of(context)
                              .switchTheme(Brightness.dark);
                        },
                        child: Text("Dark theme"),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        );
}
