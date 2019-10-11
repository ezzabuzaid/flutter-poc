import 'dart:async';
import 'package:rxdart/rxdart.dart';

class Bloc<T> {
  final _subject = PublishSubject<T>();
  Stream<T> get stream => _subject.stream;
  StreamSink<T> get sink => _subject.sink;

  dispose() {
    _subject.close();
  }
}
