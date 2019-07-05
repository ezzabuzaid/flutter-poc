import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class MenuCard extends StatelessWidget {
  MenuCard({Key key, this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleAvatar(
          radius: 25,
          child: Image.asset('assets/images/profile.png'),
        ),
        title: Text(
          this.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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

    // return Card(
    //   child: Padding(
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         Text(
    //           this.name,
    //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    //         ),
    //         IconButton(
    //           icon: Icon(
    //             EvaIcons.arrowCircleRightOutline,
    //             color: Theme.of(context).primaryColorDark,
    //           ),
    //           onPressed: () {},
    //         )
    //       ],
    //     ),
    //     padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
    //   ),
    // );
  }
}
