import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learning_flutter/app/pages/settings/index.dart';

final storage = FlutterSecureStorage();

class MealBloc {
  final _service = SettingsService();
  Stream<List<SettingsModel>> fetchSettings(String menuId) {
    if (menuId != null) {
      return _service.fetchSettingsByMenuId(menuId).asStream();
    }
    return _service.fetchSettings().asStream();
  }

  getSettings() async {
    final theme = await storage.read(key: 'theme');
    final s = SettingsModel(theme: theme);
  }
}

final settingsBloc = MealBloc();
