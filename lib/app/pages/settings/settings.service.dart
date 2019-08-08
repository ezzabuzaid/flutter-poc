import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learning_flutter/app/pages/settings/index.dart';

final storage = FlutterSecureStorage();
const _settings_key = 'settings';

class _SettingsService {
  Future<SettingsModel> getSettings() async {
    final settings = await storage.read(key: _settings_key);
    return SettingsModel.fromJson(jsonDecode(settings));
  }

  Future<void> setSettings(SettingsModel payload) async {
    return await storage.write(
      key: _settings_key,
      value: jsonEncode(payload.toJson()),
    );
  }
}

final settingsService = _SettingsService();
