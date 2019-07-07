import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/routes.dart';

class _Item {
  Text title;
  Icon icon;
  dynamic path;
  _Item({IconData icon, String title, dynamic path}) {
    this.title = Text(title, style: TextStyle(fontWeight: FontWeight.bold));
    this.icon = Icon(icon, size: 30);

    // NOTE assertion to avoid any errors
    if (path is StatelessWidget || path is StatefulWidget) this.path = path;
  }
}

class Navigation extends StatelessWidget {
  final list = [
    new _Item(
      title: 'Home',
      icon: Icons.home,
      path: RouterConstants.Home,
    ),
    new _Item(
      title: 'Meals',
      icon: Icons.home,
      path: RouterConstants.MEALS,
    ),
    new _Item(
      title: 'Menu',
      icon: Icons.mail,
      path: RouterConstants.MENUS,
    ),
    new _Item(
      title: 'My orders',
      icon: Icons.ac_unit,
      path: RouterConstants.ORDERS,
    ),
    new _Item(
      title: 'Offers',
      icon: Icons.local_offer,
      path: RouterConstants.OFFERS,
    ),
    new _Item(
      title: 'Support',
      icon: Icons.help,
      path: RouterConstants.SUPPORT,
    ),
    new _Item(
      title: 'Portal',
      icon: Icons.track_changes,
      path: RouterConstants.PORTAL,
    ),
    new _Item(
      title: 'Login',
      icon: EvaIcons.logIn,
      path: RouterConstants.LOGIN,
    ),
    new _Item(
      title: 'Signup',
      icon: EvaIcons.square,
      path: RouterConstants.REGISTER,
    ),
  ];

  Widget build(BuildContext context) {
    final seperatedListView = ListView.separated(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var item = this.list[index];
        return ListTile(
          title: item.title,
          leading: item.icon,
          onTap: () {
            Navigator.pushNamed(context, item.path);
          },
        );
      },
      itemCount: this.list.length,
      separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
    );

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture:
                CircleAvatar(child: Image.asset('assets/images/profile.png')),
            accountEmail: Text('ezzabuzaid@hotmail.com'),
            accountName: Text('Ezzabuzaid'),
            margin: EdgeInsets.all(0),
          ),
          Expanded(
            child: seperatedListView,
          ),
        ],
      ),
    );
  }
}
