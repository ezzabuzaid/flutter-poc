import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/pages/home/index.dart';
import 'package:learning_flutter/app/pages/login/login.view.dart';
import 'package:learning_flutter/app/pages/portal/portal.view.dart';
import 'package:learning_flutter/app/pages/register/register.view.dart';
import 'package:mockito/mockito.dart';
import '../fixture/index.dart';
import '../fixture/shared-preferencies.mock.dart';

void main() {
  mockSharedPreferences();
  setupLocator();
  registerButton() => findByKey('register_button');
  visitorButton() => findByKey('visitor_button');
  loginButton() => findByKey('login_button');

  group('#Portal View', () {
    testWidgets('Should redirect to RegisterView when click in the register_button', (tester) async {
      final mockObserver = await buildPage(tester, PortalView());
      expectOne(registerButton());
      await tester.tap(registerButton());
      await tester.pumpAndSettle();
      verify(mockObserver.didPush(any, any));
      expectOne(find.byType(RegisterView));
    });

    testWidgets('Should redirect to LoginView when click in the login_button', (tester) async {
      final mockObserver = await buildPage(tester, PortalView());
      expectOne(loginButton());
      await tester.tap(loginButton());
      await tester.pumpAndSettle();
      verify(mockObserver.didPush(any, any));
      expectOne(find.byType(LoginView));
    });

    testWidgets('Should redirect to HomeView when click in the visitor_button', (tester) async {
      final mockObserver = await buildPage(tester, PortalView());
      expectOne(visitorButton());
      await tester.tap(visitorButton());
      await tester.pumpAndSettle();
      verify(mockObserver.didPush(any, any));
      expectOne(find.byType(HomeView));
    });
  });
}
