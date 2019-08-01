import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/pages/olhc/ohlc.bloc.dart';

class OHLCCandle extends StatefulWidget {
  OHLCCandle({Key key}) : super(key: key);

  _OHLCCandleState createState() => _OHLCCandleState();
}

class _OHLCCandleState extends State<OHLCCandle> {
  final stream = ohlcBloc.connectToOhlcSocket();
  StreamSubscription _streamSubscription;
  @override
  void initState() {
    super.initState();
    this._streamSubscription = stream.listen((data) {
      logger.d(data);
      setState(() {
        this.sampleData.add({
          "open": data.open,
          "high": data.high,
          "low": data.low,
          "close": data.close,
          "volumeto": data.volume,
        });
      });
    });
  }

  List sampleData = [
    {"open": 50.0, "high": 100.0, "low": 40.0, "close": 80, "volumeto": 5000.0},
    {"open": 80.0, "high": 90.0, "low": 55.0, "close": 65, "volumeto": 4000.0},
    {"open": 65.0, "high": 120.0, "low": 60.0, "close": 90, "volumeto": 7000.0},
    {"open": 90.0, "high": 95.0, "low": 85.0, "close": 80, "volumeto": 2000.0},
    {"open": 80.0, "high": 85.0, "low": 40.0, "close": 50, "volumeto": 3000.0},
  ];

  @override
  Widget build(BuildContext context) {
    return OHLCVGraph(
      data: sampleData,
      enableGridLines: true,
      volumeProp: 0.2,
      gridLineAmount: 5,
      gridLineColor: Colors.grey[300],
      gridLineLabelColor: Colors.grey,
    );
  }

  @override
  void dispose() {
    this._streamSubscription.cancel();
    super.dispose();
  }
}
