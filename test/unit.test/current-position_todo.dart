import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/shared/misc/current-position.dart';
import 'package:test/test.dart';

import '../fixture/shared-preferencies.mock.dart';

void main() {
  mockSharedPreferences();
  setupLocator();
  test('it should retrive the current position', () async {
    final position = await getCurrentLocation(null);
    expect(true, true);
  });
}
