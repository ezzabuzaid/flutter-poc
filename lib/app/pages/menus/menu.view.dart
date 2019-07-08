import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../layout/navigation.dart';
import '../../layout/toolbar.dart';

class _MenuPageBody extends StatelessWidget {
  const _MenuPageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: CircleAvatar(
                      child: CachedNetworkImage(
                        imageUrl: 'this.menu.image',
                        colorBlendMode: BlendMode.overlay,
                        color: Colors.black54,
                        width: 125,
                        fit: BoxFit.cover,
                        // placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    title: Text(
                      ['Snacks', 'Chinese'][index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        EvaIcons.arrowCircleRight,
                        color: Theme.of(context).primaryColorDark,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ),
          // ),
        ),
      ),
    );
  }
}

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar('Menu'),
      body: _MenuPageBody(),
      drawer: Navigation(),
    );
  }
}