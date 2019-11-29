import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter/app/widgets/country-field.dart';

import '../fixture/index.dart';

void main() {
  group('CountryField', () {
    testWidgets('should be visible', (tester) async {
      await buildPage(tester, CountryField(isoCode: '', onChange: null));
      expectOne(findByType(CountryField));
    });
  });
}
