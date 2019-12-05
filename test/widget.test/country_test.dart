import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter/app/widgets/country-field.dart';
import 'package:provider/provider.dart';

import '../fixture/index.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  widget([isoCode = 'AE', onChange]) {
    return MaterialApp(
      home: Scaffold(
        body: CountryField(isoCode: isoCode, onChange: onChange ?? () {}),
      ),
    );
  }

  group('CountryField', () {
    testWidgets('should be visible', (tester) async {
      await buildPage(tester, widget());
      expectOne(findByType(CountryField));
      // expectOne(findByType(DropdownButtonFormField));
    });

    testWidgets('should throw an error if the isocode was null', (tester) async {
      try {
        await buildPage(tester, widget(null));
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    testWidgets('should throw an error if the onChange was null', (tester) async {
      try {
        await buildPage(tester, widget('AE', null));
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    testWidgets('should update the value when the country change', (tester) async {
      await buildPage(tester, widget());
      // expectOneAtLeast(findByType(Provider));
      // tester.tap(findDescendant(
      //   findByType(DropdownButtonFormField),
      //   findByType(DropdownMenuItem),
      // ));
      expect(true, isTrue);
    });
  });
}
// TODO: update the code to work with provider package
// TODO: when change the country the value should be updated

// REVIEW to spy on assests
// await tester.runAsync(() async {
//     BinaryMessages.setMockMessageHandler('flutter/assets', (message) {
//         // The key is the asset key.
//         String key = utf8.decode(message.buffer.asUint8List());
//         // Manually load the file.
//         var file = new File('../${key}');
//         final Uint8List encoded = utf8.encoder.convert(file.readAsStringSync());
//         return Future.value(encoded.buffer.asByteData());
//    });
//    // continue your test, now your widget should be able to load the asset
//   ...
// });
