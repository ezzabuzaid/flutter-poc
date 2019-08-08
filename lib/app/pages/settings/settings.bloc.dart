import 'dart:async';

import 'package:learning_flutter/app/pages/settings/index.dart';
import 'package:rxdart/rxdart.dart';

class SettingsBloc {
  final settings = Bloc<SettingsModel>();
  SettingsBloc() {
    settings.sink.addStream(settingsService.getSettings().asStream());
  }
}

final settingsBloc = SettingsBloc();

class Bloc<T> {
  final _subject = BehaviorSubject<T>();
  Stream<T> get stream => _subject.stream;
  StreamSink<T> get sink => _subject.sink;
  dispose() {
    _subject.close();
  }
}
