import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/pages/register/register.bloc.dart';
import 'package:learning_flutter/app/pages/register/register.view.dart';
import 'package:learning_flutter/app/partials/logo.dart';
import 'package:learning_flutter/app/shared/misc/current-position.dart';
import 'package:provider/provider.dart';

import '../fixture/index.dart';
import '../fixture/navigation.mock.dart';
import '../fixture/shared-preferencies.mock.dart';

void main() {
  mockSharedPreferences();
  setupLocator();

  setUpAll(() {
    locator.allowReassignment = true;
  });

  usernameField() => findByKey('username');
  passwordField() => findByKey('password');
  emailField() => findByKey('email');

  group('#RegisterView', () {
    testWidgets('Should construct itself', (tester) async {
      await buildPage(tester, RegisterView());
      expectOne(find.byType(RegisterView));
    });
    testWidgets('Should have the required fields', (tester) async {
      await buildPage(tester, RegisterView());
      expectOne(find.byType(Form));
      expectOne(findByType(Logo));
      expectOne(usernameField());
      expectOne(findByKey('email'));
      expectOne(findByKey('country'));
      expectOne(findByKey('mobile'));
      expectOne(passwordField());
      // TODO: expectOne(findByKey('confirm_password'));
    });
    // TODO:
    // testWidgets('Should have the auto focus in username field only', (tester) async {
    // await buildPage(tester, RegisterView());
    // final textField = tester.widgetList<TextField>(findByType(TextField));
    // final formfield = textField.singleWhere((field) => field.autofocus == true);
    // expect(true, isTrue);
    // expectOne();
    // expect(find.ancestor(of: find.byKey(formfield.key), matching: findByType(TextFormField)), usernameField());
    //     final textField = tester.widget<TextField>(findDescendant(find.byKey(field.key), findByType(TextField)));
    // textField.autofocus
    // });
    group('UserName field must', () {
      testWidgets('have autofocus', (tester) async {
        await buildPage(tester, RegisterView());
        final formfield = tester.widget<TextField>(findDescendant(usernameField(), findByType(TextField)));
        expect(formfield.autofocus, true);
      });
      testWidgets('be resticted to 16 char only', (tester) async {
        await buildPage(tester, RegisterView());
        try {
          final LengthLimitingTextInputFormatter lengthLimitingTextInputFormatter = tester
              .widget<TextField>(findDescendant(usernameField(), findByType(TextField)))
              .inputFormatters
              .firstWhere((formatter) => formatter.runtimeType == LengthLimitingTextInputFormatter);
          expect(lengthLimitingTextInputFormatter.maxLength, 16);
        } catch (e) {
          expect(true, isFalse, reason: "there's no input formatter");
        }
      });
      testWidgets('not allow special characters', (tester) async {
        await buildPage(tester, RegisterView());
        final textField = tester.widget<TextField>(findDescendant(usernameField(), findByType(TextField)));
        await tester.enterText(usernameField(), 'testText@!');
        expect(textField.controller.value.text, isEmpty);
      });
      testWidgets("present a required error if the field has empty value", (tester) async {
        await buildPage(tester, RegisterView());
        await tester.enterText(usernameField(), '');
        GlobalKey<FormState> formKey = tester.widget<Form>(findByType(Form)).key;
        formKey.currentState.validate();
        // TODO: Replace this string with constant from json file
        expectOne(find.text('This field is required'));
      });
      testWidgets('move the focus to the email field after it submittd', (tester) async {
        await buildPage(tester, RegisterView());
        await tester.tap(usernameField());
        await tester.pump();
        await tester.testTextInput.receiveAction(TextInputAction.next);
        await tester.pump();
        expect(
          FocusScope.of(RegisterView.globalKey.currentContext).focusedChild,
          RegisterView.globalKey.currentState.emailFocusNode,
        );
      });
      testWidgets('bind it"s to value payload model on save', (tester) async {
        await buildPage(tester, RegisterView());
        final formField = tester.widget<TextFormField>(usernameField());
        final value = 'testText';
        formField.onSaved(value);
        expect(locator<RegisterBloc>().payload.username, value);
      });
    });
    group('Email field must', () {
      testWidgets('have autovalidate', (tester) async {
        await buildPage(tester, RegisterView());
        expect(tester.widget<FormField>(emailField()).autovalidate, isTrue);
      });
      testWidgets('have keyboard type equal to email address', (tester) async {
        await buildPage(tester, RegisterView());
        expect(
          tester.widget<TextField>(findDescendant(emailField(), findByType(TextField))).keyboardType,
          TextInputType.emailAddress,
        );
      });
      testWidgets("present a required error if the field has empty value", (tester) async {
        await buildPage(tester, RegisterView());
        await tester.enterText(emailField(), '');
        GlobalKey<FormState> formKey = tester.widget<Form>(findByType(Form)).key;
        formKey.currentState.validate();
        // TODO: Replace this string with constant from json file
        expectOne(find.text('This field is required'));
      });
      testWidgets("present a email error if the field has wrong value", (tester) async {
        await buildPage(tester, RegisterView());
        await tester.enterText(emailField(), 'ezzabuzaid.com');
        GlobalKey<FormState> formKey = tester.widget<Form>(findByType(Form)).key;
        formKey.currentState.validate();
        // TODO: Replace this string with constant from json file
        expectOne(find.text('Please enter the email correctly'));
      });
      testWidgets('move the focus to the email field after it submittd', (tester) async {
        await buildPage(tester, RegisterView());
        await tester.tap(usernameField());
        await tester.pump();
        await tester.testTextInput.receiveAction(TextInputAction.next);
        await tester.pump();
        expect(
          FocusScope.of(RegisterView.globalKey.currentContext).focusedChild,
          RegisterView.globalKey.currentState.emailFocusNode,
        );
      });
      testWidgets('bind it"s to value payload model on save', (tester) async {
        await buildPage(tester, RegisterView());
        final formField = tester.widget<TextFormField>(usernameField());
        final value = 'testText';
        formField.onSaved(value);
        expect(locator<RegisterBloc>().payload.username, value);
      });
    });
  });

  // TODO: the form should be invalid if any of the required field is missing
  // TODO: fill all filed then make sure that the payload have them
}

// group('#RegisterBloc', () {
//   test('should have a place details with iniital iso code', () {
//     final bloc = RegisterBloc();
//     bloc.changeCountry(Country(isoCode: 'AE'));
//     expect(bloc.placeDetails.isoCountryCode, isNotEmpty);
//   });
//   test('should change the place details when change country triggeried', () {
//     final bloc = RegisterBloc();
//     bloc.changeCountry(Country(isoCode: 'AE'));
//     expect(bloc.placeDetails.isoCountryCode, equals('AE'));
//   });
//   test("should bind Username value to payload model", (tester) {
//     final value = 'testText';
//     final bloc = RegisterBloc();
//     bloc.username(value);
//     expect(bloc.payload.username, value);
//   });
//   test("should bind Password value to payload model", () {
//     final value = 'testText';
//     final bloc = RegisterBloc();
//     bloc.password(value);
//     expect(bloc.payload.password, value);
//   });
//   test("should bind Email value to payload model", () {
//     final value = 'testText';
//     final bloc = RegisterBloc();
//     bloc.email(value);
//     expect(bloc.payload.email, value);
//   });
//   test("should bind Mobile value to payload model", () {
//     final value = 'testText';
//     final bloc = RegisterBloc();
//     bloc.mobile(value);
//     expect(bloc.payload.mobile, value);
//   });
//   test("should bind Role value to payload model", () {
//     final value = 0;
//     final bloc = RegisterBloc();
//     bloc.role(value);
//     expect(bloc.payload.role, value);
//   });
// });
