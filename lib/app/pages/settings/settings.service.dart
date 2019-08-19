import 'dart:convert';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/helpers/storage.dart';
import 'package:learning_flutter/app/pages/settings/index.dart';

const _settings_key = 'settings';
int times = 0;

class _SettingsService {
  Future<SettingsModel> getSettings() async {
    String encodedSettings = await Storage().get(_settings_key);
    if (encodedSettings == null) {
      await setSettings(SettingsModel(
        darkMode: false,
        notification: true,
      ));
      return await getSettings();
    }
    return SettingsModel.fromJson(json.decode(encodedSettings));
  }

  Future<void> setSettings(SettingsModel payload) async {
    logger.w('setSettings');
    return await Storage().set(_settings_key, json.encode(payload.toJson()));
  }
}

final settingsService = _SettingsService();
