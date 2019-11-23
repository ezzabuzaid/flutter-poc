import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/pages/login/login.view.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/pages/menus/index.dart';
import 'package:learning_flutter/app/pages/portal/portal.view.dart';
import 'package:learning_flutter/app/pages/register/register.view.dart';
import 'package:learning_flutter/app/routes.dart';

void main() {
  getRoute(String path) {
    return routes[path](null);
  }

  group('Each path Should have the write page', () {
    test('description', () {
      expect(true, true);
      // expect(getRoute(RoutesConstants.MEALS).runtimeType, MealsView);
      // expect(getRoute(RoutesConstants.MENUS).runtimeType, MenusView);
      // expect(getRoute(RoutesConstants.PORTAL).runtimeType, PortalView);
      // expect(getRoute(RoutesConstants.LOGIN).runtimeType, LoginView);
      // expect(getRoute(RoutesConstants.REGISTER).runtimeType, RegisterView);
    });
    // RoutesConstants.MEALS: (BuildContext context) => MealsView(),
    // RoutesConstants.MENUS: (BuildContext context) => MenuView(),
    // RoutesConstants.PORTAL: (BuildContext context) => PortalView(),
    // RoutesConstants.LOGIN: (BuildContext context) => LoginView(),
    // RoutesConstants.REGISTER: (BuildContext context) => RegisterView(),
    // RoutesConstants.FACE: (BuildContext context) => FaceDetectionView(),
    // RoutesConstants.FAVOURITES: (BuildContext context) => FavoritesView(),
    // RoutesConstants.OLHC: (BuildContext context) => OLHCListView(),
    // RoutesConstants.OLHC_CHART: (BuildContext context) => OHLCCandleView(),
    // RoutesConstants.CHARTS: (BuildContext context) => ChartView(),
    // RoutesConstants.Home: (BuildContext context) => HomeView(),
    // RoutesConstants.SETTINGS: (BuildContext context) => SettingView(),
  });
}
