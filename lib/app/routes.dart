import 'package:flutter/cupertino.dart';
import 'core/constants.dart';
import 'pages/face-detection/face-detection.dart';
import 'pages/favorites/index.dart';
import 'pages/meals/index.dart';
import 'pages/menus/menus.view.dart';
import 'pages/olhc/index.dart';
import 'pages/portal/index.dart';


final routes = {
  // '/': (BuildContext context) => ,
  RoutesConstants.MEALS: (BuildContext context) => MealsView(),
  RoutesConstants.MENUS: (BuildContext context) => MenuView(),
  RoutesConstants.LOGIN: (BuildContext context) => LoginView(),
  RoutesConstants.REGISTER: (BuildContext context) => RegisterView(),
  RoutesConstants.FACE: (BuildContext context) => FaceDetectionView(),
  RoutesConstants.FAVOURITES: (BuildContext context) => FavoritesView(),
  RoutesConstants.OLHC: (BuildContext context) => OLHCListView(),
  RoutesConstants.OLHC_CHART: (BuildContext context) => OHLCCandleView(),
  RoutesConstants.Home: (BuildContext context) => MealsView(),
  RoutesConstants.Home: (BuildContext context) => MealsView(),
  RoutesConstants.Home: (BuildContext context) => MealsView(),
};
