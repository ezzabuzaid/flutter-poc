import 'package:flutter/services.dart';

mockSharedPreferences([Map<String, String> values = const {}]) {
  const MethodChannel('plugins.flutter.io/shared_preferences')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'getAll') {
      return values.map((key, value) => MapEntry('flutter.$key', value));
    }
    return null;
  });
}
