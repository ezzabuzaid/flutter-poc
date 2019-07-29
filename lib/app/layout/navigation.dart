import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/app/routes.dart';

class _Item {
  Text title;
  Icon icon;
  dynamic path;
  _Item({IconData icon, String title, dynamic path}) {
    this.title = Text(title, style: TextStyle(fontWeight: FontWeight.bold));
    this.icon = Icon(
      icon,
      size: 30,
      color: Colors.black87,
    );
    this.path = path;
  }
}

class Navigation extends StatelessWidget {
  final list = [
    new _Item(
      title: 'Home',
      icon: Icons.home,
      path: RoutesConstants.Home,
    ),
    new _Item(
      title: 'Meals',
      icon: Icons.home,
      path: RoutesConstants.MEALS,
    ),
    new _Item(
      title: 'Menu',
      icon: Icons.mail,
      path: RoutesConstants.MENUS,
    ),
    new _Item(
      title: 'My orders',
      icon: Icons.ac_unit,
      path: RoutesConstants.ORDERS,
    ),
    new _Item(
      title: 'Offers',
      icon: Icons.local_offer,
      path: RoutesConstants.OFFERS,
    ),
    new _Item(
      title: 'Support',
      icon: Icons.help,
      path: RoutesConstants.SUPPORT,
    ),
    new _Item(
      title: 'Portal',
      icon: Icons.track_changes,
      path: RoutesConstants.PORTAL,
    ),
    new _Item(
      title: 'Login',
      icon: EvaIcons.logIn,
      path: RoutesConstants.LOGIN,
    ),
    new _Item(
      title: 'Signup',
      icon: EvaIcons.square,
      path: RoutesConstants.REGISTER,
    ),
    new _Item(
      title: 'Favourites',
      icon: EvaIcons.heartOutline,
      path: RoutesConstants.FAVOURITES,
    ),
    new _Item(
      title: 'Face detection',
      icon: EvaIcons.checkmarkSquare2Outline,
      path: RoutesConstants.FACE,
    ),
    new _Item(
      title: 'OLHC',
      icon: EvaIcons.checkmarkSquare2Outline,
      path: RoutesConstants.OLHC,
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
            currentAccountPicture: CircleAvatar(
              child: Image.asset('lib/assets/images/profile.png'),
            ),
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
