import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart' as prefix0;
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/pages/register/register.view.dart';
import 'package:learning_flutter/app/partials/logo.dart';
import 'package:learning_flutter/app/shared/misc/current-position.dart';

import '../fixture/index.dart';
import '../fixture/navigation.mock.dart';
import '../fixture/shared-preferencies.mock.dart';

void main() {
  LiveTestWidgetsFlutterBinding();
  mockSharedPreferences();
  setupLocator();

  group('#RegisterView', () {
    testWidgets('Should construct itself', (tester) async {
      await buildPage(tester, RegisterView());
      expectOne(find.byType(RegisterView));
    });
    testWidgets('Should have the required fields', (tester) async {
      await buildPage(tester, RegisterView());
      expectOne(find.byType(Form));
      expectOne(findByKey('username'));
      expectOne(findByKey('email'));
      // TODO: test the country widget first then expectOne(findByKey('country'));
      expectOne(findByKey('mobile'));
      expectOne(findByKey('password'));
      // TODO: expectOne(findByKey('confirm_password'));
    });
  });

  group('UserName field must', () {
    testWidgets('have autofocus', (tester) async {
      await buildPage(tester, RegisterView());
      final formfield = tester.widget<TextField>(findDescendant(findByKey('username'), findByType(TextField)));
      expect(formfield.autofocus, true);
    });
    testWidgets('be resticted to 16 char only', (tester) async {
      await buildPage(tester, RegisterView());
      try {
        final LengthLimitingTextInputFormatter lengthLimitingTextInputFormatter = tester
            .widget<TextField>(findDescendant(findByKey('username'), findByType(TextField)))
            .inputFormatters
            .firstWhere((formatter) => formatter.runtimeType == LengthLimitingTextInputFormatter);
        expect(lengthLimitingTextInputFormatter.maxLength, 16);
      } catch (e) {
        expect(true, false, reason: "there's no input formatter");
      }
    });

    testWidgets('not allow special characters', (tester) async {
      await buildPage(tester, RegisterView());
      final textField = tester.widget<TextField>(findDescendant(findByKey('username'), findByType(TextField)));
      await tester.enterText(findByKey('username'), 'testText@!');
      expect(textField.controller.value.text, isEmpty);
    });

    testWidgets("present a required error if the field has empty value", (tester) async {
      await buildPage(tester, RegisterView());
      // final textField = tester.widget<TextField>(findDescendant(findByKey('username'), findByType(TextField)));
      await tester.enterText(findByKey('username'), '');
      GlobalKey<FormState> formKey = tester.widget<Form>(findByType(Form)).key;
      formKey.currentState.validate();
      // TODO: Replace this string with constant from json file
      expectOne(find.text('This field is required'));
    });
    testWidgets("bind it's value to payload model", (tester) async {
      await buildPage(tester, RegisterView());
      final value = 'testText';
      final formField = tester.widget<TextFormField>(findByKey('username'));
      formField.onSaved(value);
      expect(RegisterView.globalKey.currentState.payload.username, value);
    });
    testWidgets('move the focus to the email field after it submittd', (tester) async {
      await buildPage(tester, RegisterView());
      await tester.tap(findByKey('username'));
      await tester.pump();
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump();
      expect(FocusScope.of(RegisterView.globalKey.currentContext).focusedChild,
          RegisterView.globalKey.currentState.emailFocusNode);
    });
  });

  // TODO: the form should be invalid if any of the required field is missing
  // TODO: fill all filed then make sure that the payload have them
}
