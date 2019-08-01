import 'dart:convert';

import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/pages/olhc/ohlc.servcie.dart';
import 'package:learning_flutter/app/pages/olhc/olhc.model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';

final socketEndpoint = 'wss://node-buildozer.herokuapp.com/olhc';

class OhlcBloc {
  final _service = OHLCService();
  final _channel = IOWebSocketChannel.connect(socketEndpoint);
  Stream _stream;

  OhlcBloc() {
    this._stream = _channel.stream.asBroadcastStream();
  }

  Observable<OLHCModel> connectToOhlcSocket() {
    logger.i("Connection to connectToOhlcSocket");
    return Observable.merge(
      [
        _service.connectToOhlcSocketHttpEndpoint().asStream().cast<OLHCModel>(),
        _stream.map((data) => OLHCModel.fromJson(json.decode(data)))
      ],
    ).skip(1).asBroadcastStream();
  }
}

final ohlcBloc = OhlcBloc();
