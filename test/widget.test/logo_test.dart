import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter/app/partials/logo.dart';

import '../fixture/index.dart';

void main() {
  group('LogoWidget', () {
    testWidgets('should be visible', (tester) async {
      await buildPage(tester, Logo());
      expectOne(findByType(Logo));
    });
  });
}
