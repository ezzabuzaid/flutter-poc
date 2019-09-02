import 'package:learning_flutter/app/core/helpers/bloc/bloc.dart';
import 'package:learning_flutter/app/pages/settings/index.dart';

class SettingsBloc {
  final settings = Bloc<SettingsModel>();
  SettingsBloc() {
    settings.sink.addStream(settingsService.getSettings().asStream());
  }

  setSettings(SettingsModel data) {
    settingsService.setSettings(data);
    settings.sink.add(data);
  }
}

final settingsBloc = SettingsBloc();
