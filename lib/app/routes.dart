import 'package:flutter/cupertino.dart';
import 'package:learning_flutter/app/pages/forget-password/forget-password.view.dart';
import 'package:learning_flutter/app/pages/home/home.view.dart';
import 'package:learning_flutter/app/pages/login/login.view.dart';
import 'package:learning_flutter/app/pages/portal/portal.view.dart';
import 'package:learning_flutter/app/pages/register/register.view.dart';
import 'package:learning_flutter/app/pages/settings/index.dart';
import 'core/constants/index.dart';
import 'pages/favorites/index.dart';
import 'pages/meals/index.dart';
import 'pages/menus/menus.view.dart';
import 'pages/olhc/index.dart';

final routes = {
  // '/': (BuildContext context) => ,
  RoutesConstants.PORTAL: (BuildContext context) => PortalView(),
  RoutesConstants.LOGIN: (BuildContext context) => LoginView(),
  RoutesConstants.REGISTER: (BuildContext context) => RegisterView(),
  RoutesConstants.FORGET_PASSWORD: (BuildContext context) => ForgetPassowrdView(),

  RoutesConstants.MEALS: (BuildContext context) => MealsView(),
  RoutesConstants.MENUS: (BuildContext context) => MenusView(),
  RoutesConstants.FAVOURITES: (BuildContext context) => FavoritesView(),
  RoutesConstants.OLHC: (BuildContext context) => OLHCListView(),
  RoutesConstants.Home: (BuildContext context) => HomeView(),
  RoutesConstants.SETTINGS: (BuildContext context) => SettingView(),
};
