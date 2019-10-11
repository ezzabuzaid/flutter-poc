import 'package:flutter/material.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:provider/provider.dart';
import 'package:learning_flutter/app/pages/menus/menus.model.dart';
import 'package:learning_flutter/app/pages/home/home.bloc.dart';

class MenusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final bloc = locator<HomeBloc>();
    return Consumer<HomeBloc>(
      builder: (context, bloc, child) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          itemCount: bloc.menus.length,
          itemBuilder: (BuildContext context, int index) {
            final menu = bloc.menus[index];
            return Row(
              children: <Widget>[
                FlatButton(
                  color: bloc.menuIndex == index
                      ? Colors.grey.shade200
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    menu.name,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                      bloc.changeMenu(index);
                  },
                ),
                SizedBox(width: 20),
              ],
            );
          },
        );
      },
    );
  }
}
