import 'package:flutter/cupertino.dart';
import 'package:learning_flutter/pages/meals/index.dart';
import 'package:learning_flutter/pages/menus/menu.view.dart';
import 'package:learning_flutter/pages/portal/index.dart';

class RouterConstants {
  static const MEALS = '/meals';
  static const LOGIN = '/portal/login';
  static const MENUS = '/menus';
  static const Home = '/home';
  static const ORDERS = '/orders';
  static const OFFERS = '/offers';
  static const SUPPORT = '/support';
  static const PORTAL = '/portal';
  static const REGISTER = '/portal/register';
}

final routes = {
  [RouterConstants.MEALS]: (BuildContext context) => MealsView(),
  [RouterConstants.MENUS]: (BuildContext context) => MenuView(),
  [RouterConstants.LOGIN]: (BuildContext context) => LoginView(),
  [RouterConstants.Home]: (BuildContext context) => MealsView(),
  [RouterConstants.Home]: (BuildContext context) => MealsView(),
  [RouterConstants.Home]: (BuildContext context) => MealsView(),
  [RouterConstants.Home]: (BuildContext context) => MealsView(),
};
