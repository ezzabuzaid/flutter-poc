import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants.dart';
import 'package:learning_flutter/app/shared/user.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';

class _Item {
  final String id;
  final Text title;
  final Icon icon;
  final dynamic path;
  final bool needAuth;
  _Item({
    IconData icon,
    String title,
    BuildContext context,
    this.path,
    this.id,
    this.needAuth = false,
  })  : this.title = Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        this.icon = Icon(icon, size: 30);
}

class Navigation extends StatelessWidget {
  list(context) {
    return [
      new _Item(
        title: 'Home',
        icon: Icons.home,
        path: RoutesConstants.Home,
        context: context,
      ),
      new _Item(
        title: 'Meals',
        icon: Icons.fastfood,
        path: RoutesConstants.MEALS,
        context: context,
      ),
      new _Item(
        title: 'Menu',
        icon: Icons.view_list,
        path: RoutesConstants.MENUS,
        context: context,
      ),
      new _Item(
        title: 'My orders',
        icon: Icons.ac_unit,
        path: RoutesConstants.ORDERS,
        context: context,
        needAuth: true,
      ),
      new _Item(
        title: 'Offers',
        icon: Icons.local_offer,
        path: RoutesConstants.OFFERS,
        context: context,
      ),
      new _Item(
        title: 'Support',
        icon: Icons.help,
        path: RoutesConstants.SUPPORT,
        context: context,
        needAuth: true,
      ),
      // new _Item(
      //   title: 'Portal',
      //   icon: Icons.track_changes,
      //   path: RoutesConstants.PORTAL,
      //   context: context,
      // ),
      // new _Item(
      //   title: 'Login',
      //   icon: EvaIcons.logIn,
      //   path: RoutesConstants.LOGIN,
      //   context: context,
      // ),
      // new _Item(
      //   title: 'Signup',
      //   icon: EvaIcons.square,
      //   path: RoutesConstants.REGISTER,
      //   context: context,
      // ),
      new _Item(
        title: 'Favourites',
        icon: Icons.favorite,
        path: RoutesConstants.FAVOURITES,
        context: context,
        needAuth: true,
      ),
      new _Item(
        title: 'Face detection',
        icon: Icons.face,
        path: RoutesConstants.FACE,
        context: context,
      ),
      new _Item(
        title: 'OLHC',
        icon: EvaIcons.barChartOutline,
        path: RoutesConstants.OLHC,
        context: context,
      ),
      new _Item(
        title: 'Chart',
        icon: Icons.pie_chart,
        path: RoutesConstants.CHARTS,
        context: context,
      ),
    ];
  }

  Widget build(BuildContext context) {
    final List<_Item> list = this.list(context);

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Image.asset('lib/assets/images/profile.png'),
            ),
            accountEmail: Text('ezzabuzaid@hotmail.com'),
            accountName: Text('Ezzabuzaid'),
            margin: EdgeInsets.all(0),
          ),
          Expanded(
            child: FutureBuilder(
              future: User().isAuthenticated(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == false) {
                  list.removeWhere((item) => item.needAuth);
                }
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = list[index];
                    return ListTile(
                      title: item.title,
                      leading: item.icon,
                      onTap: () {
                        Navigator.pushNamed(context, item.path);
                      },
                    );
                  },
                  itemCount: list.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(height: 0),
                );
              },
            ),
          ),
          FutureBuilder(
            future: User().isAuthenticated(),
            builder: (context, AsyncSnapshot<bool> snapshot) {
              Widget widget;
              if (snapshot.data == true) {
                widget = Align(
                  widthFactor: 1,
                  alignment: Alignment.centerLeft,
                  child: FlatButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RoutesConstants.SETTINGS);
                    },
                    icon: Icon(Icons.settings),
                    label: Text('Setting'),
                  ),
                );
              } else {
                widget = FlatButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RoutesConstants.LOGIN);
                  },
                  child: Text('Login'),
                  padding: EdgeInsets.symmetric(vertical: 15),
                );
              }
              return FullWidth(child: widget);
            },
          )
        ],
      ),
    );
  }
}
