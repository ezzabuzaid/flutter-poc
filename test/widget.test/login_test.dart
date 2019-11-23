import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/pages/login/login.view.dart';
import 'package:learning_flutter/app/pages/register/register.view.dart';
import 'package:learning_flutter/app/shared/models/portal.model.dart';
import 'package:learning_flutter/app/shared/services/user/user.service.dart';
import 'package:mockito/mockito.dart';

import '../fixture/index.dart';
import '../fixture/shared-preferencies.mock.dart';

void main() {
  LiveTestWidgetsFlutterBinding();
  mockSharedPreferences();
  setupMockLocator();
  usernameField() => findByKey('username');
  passwordField() => findByKey('password');
  registerButton() => findByKey('register_button');
  loginButton() => findByKey('login_button');

  group('#LoginView', () {
    testWidgets('Should construct itself', (tester) async {
      await buildPage(tester, LoginView());
      expectOne(findByType(LoginView));
    });
    testWidgets('Should have the nessccary elements', (tester) async {
      await buildPage(tester, LoginView());
      expectOne(findByType(Form));
      expectOne(usernameField());
      expectOne(passwordField());
      expectOne(registerButton());
      expectOne(loginButton());
    });

    testWidgets('Register button should navigate to register page', (tester) async {
      final mockObserver = await buildPage(tester, LoginView());
      await tester.tap(registerButton());
      await tester.pumpAndSettle();
      verify(mockObserver.didPush(any, any));
      expectOne(findByType(RegisterView));
    });
  });

  group('Username field must', () {
    testWidgets('have autofocus', (tester) async {
      await buildPage(tester, LoginView());
      final textField = tester.widget<TextField>(findDescendant(usernameField(), findByType(TextField)));
      expect(textField.autofocus, isTrue);
    });

    testWidgets("present a required error if the field has empty value", (tester) async {
      await buildPage(tester, LoginView());
      await tester.enterText(usernameField(), '');
      GlobalKey<FormState> formKey = tester.widget<Form>(findByType(Form)).key;
      formKey.currentState.validate();
      await tester.pump();
      // TODO: Replace this string with constant from json file
      expectOne(findDescendant(usernameField(), find.text('This field is required')));
    });
    testWidgets("bind it's value to payload model", (tester) async {
      await buildPage(tester, LoginView());
      final value = 'testText';
      final formField = tester.widget<TextFormField>(usernameField());
      formField.onSaved(value);
      expect(LoginView.globalKey.currentState.payload.username, value);
    });
    testWidgets('move the focus to the password field after it submittd', (tester) async {
      await buildPage(tester, LoginView());
      await tester.tap(usernameField());
      await tester.testTextInput.receiveAction(TextInputAction.next);
      expect(
        FocusScope.of(LoginView.globalKey.currentContext).focusedChild,
        LoginView.globalKey.currentState.passwordFocusNode,
      );
    });
  });

  group('Password field must', () {
    testWidgets("present a required error if the field has empty value", (tester) async {
      await buildPage(tester, LoginView());
      await tester.enterText(passwordField(), '');
      GlobalKey<FormState> formKey = tester.widget<Form>(findByType(Form)).key;
      formKey.currentState.validate();
      await tester.pump();
      // TODO: Replace this string with constant from json file
      expectOne(findDescendant(passwordField(), find.text('This field is required')));
    });
    testWidgets("bind it's value to payload model", (tester) async {
      await buildPage(tester, LoginView());
      final value = 'testText';
      final formField = tester.widget<TextFormField>(passwordField());
      formField.onSaved(value);
      expect(LoginView.globalKey.currentState.payload.password, value);
    });

    testWidgets("be obscure", (tester) async {
      await buildPage(tester, LoginView());
      final textField = tester.widget<TextField>(findDescendant(passwordField(), findByType(TextField)));
      expect(textField.obscureText, isTrue);
    });
  });

  group('form should', () {
    testWidgets('form should be invalid if any field is not valid', (tester) async {
      await buildPage(tester, LoginView());
      await tester.enterText(usernameField(), 'ezzabuzaid');
      GlobalKey<FormState> formKey = tester.widget<Form>(findByType(Form)).key;
      expect(formKey.currentState.validate(), isFalse);
      await tester.enterText(usernameField(), '');
      await tester.enterText(passwordField(), '123456798');
      expect(formKey.currentState.validate(), isFalse);
    });

    testWidgets('be valid if all field is valid', (tester) async {
      await buildPage(tester, LoginView());
      await tester.enterText(usernameField(), 'ezzabuzaid');
      await tester.enterText(passwordField(), '123456798');
      GlobalKey<FormState> formKey = tester.widget<Form>(findByType(Form)).key;
      expect(formKey.currentState.validate(), isTrue);
    });
  });

  group('Login button should', () {
    testWidgets('save all values to payload model when clicked', (tester) async {
      final mockObserver = await buildPage(tester, LoginView());
      await tester.enterText(usernameField(), 'ezzabuzaid');
      await tester.enterText(passwordField(), '123456798');
      final user = locator<UserService>();
      await tester.tap(loginButton());
      expect(
        LoginView.globalKey.currentState.payload.toJson(),
        LoginModel(username: 'ezzabuzaid', password: '123456798').toJson(),
      );
      when(user.login(any, any)).thenAnswer((_) async => any);
      verify(user.login(any, any));
      await untilCalled(user.login(any, any));
      // verify(mockObserver.didReplace(oldRoute: any));

      // TODO: assert expectOne(findByType(HomeView));
    });
  });
  // TODO: assert that remember is functional by checking the value of remember me
  // TODO: assert that remember me doesn't save the token in localstorage
  // TODO: assert that forgot password button is functional
}
