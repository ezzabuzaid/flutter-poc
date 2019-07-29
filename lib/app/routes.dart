import 'package:flutter/cupertino.dart';
import 'package:learning_flutter/app/pages/check/check.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/pages/menus/menu.view.dart';
import 'package:learning_flutter/app/pages/olhc/olhc.dart';
import 'package:learning_flutter/app/pages/portal/index.dart';

class RoutesConstants {
  static const MEALS = '/meals';
  static const LOGIN = '/portal/login';
  static const REGISTER = '/portal/register';
  static const MENUS = '/menus';
  static const Home = '/home';
  static const ORDERS = '/orders';
  static const OFFERS = '/offers';
  static const SUPPORT = '/support';
  static const PORTAL = '/portal';
  static const FAVOURITES = '/favourites';
  static const FACE = '/face';
  static const OLHC = '/olhc';
}

final routes = {
  // '/': (BuildContext context) => ,
  RoutesConstants.MEALS: (BuildContext context) => MealsView(),
  RoutesConstants.MENUS: (BuildContext context) => MenuView(),
  RoutesConstants.LOGIN: (BuildContext context) => LoginView(),
  RoutesConstants.REGISTER: (BuildContext context) => RegisterView(),
  RoutesConstants.FACE: (BuildContext context) => FaceDetection(),
  RoutesConstants.Home: (BuildContext context) => MealsView(),
  RoutesConstants.Home: (BuildContext context) => MealsView(),
  RoutesConstants.Home: (BuildContext context) => MealsView(),
  RoutesConstants.Home: (BuildContext context) => MealsView(),
  RoutesConstants.OLHC: (BuildContext context) => OLHC(),
};
