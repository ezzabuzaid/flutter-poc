// This is a basic Flutter widget test
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter/app/app.dart';
import 'package:learning_flutter/app/core/helpers/token.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/pages/home/home.view.dart';
import 'package:learning_flutter/app/pages/portal/portal.view.dart';
import 'package:learning_flutter/app/shared/services/user/user.service.dart';

import '../fixture/shared-preferencies.mock.dart';

void main() {
  mockSharedPreferences({});
  setupLocator();
  final tokenHelper = locator<TokenHelper>();
  final user = locator<UserService>();

  setUpAll(() {});

  group('#App', () {
    // TODO: Enable it
    // tearDown(() async {
    //   tokenHelper.removeToken();
    // });
    // STUB make the FutureProvider fail by providing an error
    // STUB update the app twice, every time with new bool value
    // STUB find a lib to validate the token
    testWidgets(
        'Should redirect to portal view if the user is not authenticated',
        (WidgetTester tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(PortalView), findsOneWidget);
      expect(find.byType(HomeView), findsNothing);
    });
    // NOTE: not enough to check the token existance,
    // STUB: check it's validaty and expire time
    testWidgets("Should redirect to HomeView if there's a token",
        (WidgetTester tester) async {
      await tester.runAsync(() => tokenHelper.setToken('J.W.T'));
      await tester.pumpWidget(App());
      await tester.runAsync(() => user.isAuthenticated());
      await tester.pump();
      expect(find.byType(PortalView), findsNothing);
      expect(find.byType(HomeView), findsOneWidget);
      //  TODO the below line should be in the teardown function
      tester.runAsync(() => tokenHelper.removeToken());
    });

    // TODO: enable that after testing the portal view and home view
    testWidgets("Should redirect to Login if the token removed",
        (WidgetTester tester) async {
      await tester.runAsync(() => tokenHelper.setToken('J.W.T'));
      await tester.pumpWidget(App());
      await tester.runAsync(() => user.isAuthenticated());
      await tester.pump();
      await tester.runAsync(() => tokenHelper.removeToken());
      await tester.pump();
      expect(find.byType(PortalView), findsOneWidget);
      expect(find.byType(HomeView), findsNothing);
    });
  });
}
