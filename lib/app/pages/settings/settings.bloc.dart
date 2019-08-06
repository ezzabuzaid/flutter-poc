import 'dart:async';

import 'package:learning_flutter/app/pages/settings/index.dart';

class MealBloc {
  final _service = SettingsService();
  Stream<List<SettingsModel>> fetchSettings(String menuId) {
    if (menuId != null) {
      return _service.fetchSettingsByMenuId(menuId).asStream();
    }
    return _service.fetchSettings().asStream();
  }
}

final settingsBloc = MealBloc();
