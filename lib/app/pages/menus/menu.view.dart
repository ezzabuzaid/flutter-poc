import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/app/pages/menus/menu.bloc.dart';
import 'package:learning_flutter/app/pages/menus/menus.model.dart';
import 'package:learning_flutter/app/routes.dart';

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
            child: StreamBuilder(
              stream: menuBloc.fetchMeals(),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<MenusModel>> snapshot,
              ) {
                if (snapshot.hasError) return Text(snapshot.error.toString());
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final menus = snapshot.data;
                return ListView.builder(
                  itemCount: menus.length,
                  itemBuilder: (BuildContext context, int index) {
                    final menu = menus[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        leading: CircleAvatar(
                          child: CachedNetworkImage(
                            imageUrl: menu.image,
                            colorBlendMode: BlendMode.overlay,
                            color: Colors.black54,
                            width: 125,
                            fit: BoxFit.fill,
                            // placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        title: Text(
                          menu.name,
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
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RoutesConstants.MEALS,
                              arguments: menu.id,
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
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
