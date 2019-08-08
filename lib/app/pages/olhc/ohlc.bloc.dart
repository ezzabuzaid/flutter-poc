import 'dart:convert';
import 'package:learning_flutter/app/pages/olhc/ohlc.servcie.dart';
import 'package:learning_flutter/app/pages/olhc/olhc.model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';

final socketEndpoint = 'wss://node-buildozer.herokuapp.com';

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}

class OhlcBloc {
  final _service = OHLCService();
  Stream _stream;

  Observable<SocketResponseModel> connectToOhlcSocket(String name) {
    final _channel = IOWebSocketChannel.connect(
      socketEndpoint,
    );
    this._stream = _channel.stream.asBroadcastStream();
    return Observable.fromFuture(_service.connectToOhlcSocketHttpEndpoint(name))
        .switchMap((v) => _stream)
        .map((data) => SocketResponseModel.fromJson(json.decode(data)));
  }
}

final ohlcBloc = OhlcBloc();
