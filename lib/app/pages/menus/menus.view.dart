import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/app/app.dart';
import '../../core/constants/index.dart';
import '../../layout/navigation.dart';
import '../../layout/toolbar.dart';
import 'index.dart';
import 'menus.model.dart';

class _MenuPageBody extends StatefulWidget {
  @override
  _MenuPageBodyState createState() => _MenuPageBodyState();
}

class _MenuPageBodyState extends State<_MenuPageBody> {
  @override
  void initState() {
    menuBloc.fetchMenus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: StreamBuilder<List<MenusModel>>(
              stream: menuBloc.menus.stream,
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
                        leading: Container(
                          width: 75,
                          height: 75,
                          // foregroundDecoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          // child: CachedNetworkImage(
                          //   imageUrl: menu.image,
                          //   // colorBlendMode: BlendMode.overlay,
                          //   // color: Colors.black54,
                          //   // fit: BoxFit.cover,
                          //   errorWidget: (context, url, error) =>
                          //       Icon(Icons.error),
                          // ),
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
                            color: ThemeSwitcher.of(context).mode ==
                                    Brightness.dark
                                ? Theme.of(context).primaryColorLight
                                : Theme.of(context).primaryColorDark,
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

  @override
  void dispose() {
    menuBloc.menus.dispose();
    super.dispose();
  }
}

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(context: context),
      body: _MenuPageBody(),
      drawer: Navigation(),
    );
  }
}
