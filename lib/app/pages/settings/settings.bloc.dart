import 'package:flutter/material.dart';
import 'package:learning_flutter/app/pages/settings/index.dart';

class SettingsBloc with ChangeNotifier {
  SettingsModel settings;

  void presistSettings() async {
    await settingsService.setSettings(this.settings);
    notifyListeners();
  }

  void getSettings() async {
    settings = await settingsService.getSettings();
    notifyListeners();
  }

  void switchTheme() async {
    settings.darkMode = !settings.darkMode;
    presistSettings();
  }

}
