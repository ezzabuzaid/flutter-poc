import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants.dart';

class Toolbar extends AppBar {
  final BuildContext context;
  Toolbar({
    this.context,
  }) : super(
          titleSpacing: 0,
          title: SizedBox(
            height: 35,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for meal',
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 1),
                filled: true,
                fillColor: Colors.white30,
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () => Navigator.pushNamed(context, RoutesConstants.FAVOURITES),
            )
          ],
        );
}
