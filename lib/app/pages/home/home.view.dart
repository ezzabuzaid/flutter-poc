import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_flutter/app/app.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/pages/home/home-meals.dart';
import 'package:learning_flutter/app/pages/home/home-menus.dart';
import 'package:learning_flutter/app/pages/home/home.bloc.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/pages/menus/index.dart';
import 'package:provider/provider.dart';
import '../../layout/index.dart';
import '../../layout/toolbar.dart';

class HomeBody extends StatelessWidget {
  HomeBody({Key key}) : super(key: key) {
    final bloc = locator<HomeBloc>();
    bloc.fetchMenus();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeBloc>(
      child: Column(
        children: <Widget>[
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: App.isLight() ? Colors.black26 : Colors.transparent,
                  blurRadius: 100,
                ),
              ],
            ),
            height: 40,
            child: MenusWidget(),
          ),
          SizedBox(height: 15),
          MealsWidget(),
        ],
      ),
      builder: (_) => locator<HomeBloc>(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(context: context),
      drawer: Navigation(),
      body: HomeBody(),
    );
  }
}
