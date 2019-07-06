import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/pages/menus/menu.view.dart';
import '../pages/meals/melas.view.dart';
import '../pages/portal/index.dart';

class _Item {
  Text title;
  Icon icon;
  dynamic page;
  _Item({IconData icon, String title, dynamic page}) {
    this.title = Text(title, style: TextStyle(fontWeight: FontWeight.bold));
    this.icon = Icon(icon, size: 30);

    // NOTE assertion to avoid any errors
    if (page is StatelessWidget || page is StatefulWidget) this.page = page;
  }
}

class Navigation extends StatelessWidget {
  final list = [
    new _Item(title: 'Home', icon: Icons.home, page: MealsView()),
    new _Item(title: 'Menu', icon: Icons.mail, page: MenuPage()),
    new _Item(title: 'My orders', icon: Icons.ac_unit),
    new _Item(title: 'Offers', icon: Icons.local_offer),
    new _Item(title: 'Support', icon: Icons.help),
    new _Item(title: 'Portal', icon: Icons.track_changes),
    new _Item(title: 'Login', icon: EvaIcons.logInOutline, page: LoginPage()),
    new _Item(title: 'Signup', icon: EvaIcons.square),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => item.page),
            );
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
