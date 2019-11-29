import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('#Login Page', () {
    final usernameField = find.byValueKey('username');
    final passwordField = find.byValueKey('password');
    final loginButton = find.byValueKey('login_button');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });
    test('Username and password should be empty', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      await driver.tap(usernameField);
      await driver.enterText('ezzabuzaid');
      await driver.waitFor(find.text('ezzabuzaid'));
      await driver.tap(passwordField);
      await driver.enterText('123456789');
      await driver.waitFor(find.text('123456789'));
      await driver.tap(loginButton);
    });

// await tester.enterText(find.byKey(new Key('txtFieldKey')), 'Hello World!');
// await tester.testTextInput.receiveAction(TextInputAction.done);
// await tester.pump();
  });
}
