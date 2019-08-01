import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:learning_flutter/app/pages/charts/charts.model.dart';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';

final channel =
    IOWebSocketChannel.connect('wss://ws.coincap.io/trades/binance');

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  StreamSubscription _stream;
  @override
  void initState() {
    this._stream = channel.stream.listen((value) {
      print(value);
      var data = CoincapModel.fromJson(json.decode(value)).toJson();
      _chartKey.currentState.updateData([circularStack(data)]);
    });
    super.initState();
  }

  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  @override
  Widget build(BuildContext context) {
    return AnimatedCircularChart(
      key: _chartKey,
      size: const Size(300, 300),
      chartType: CircularChartType.Pie,
      initialChartData: <CircularStackEntry>[
        circularStack(CoincapModel.fromJson({}).toJson()),
      ],
    );
  }

  @override
  void deactivate() {
    this._stream.cancel();
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

circularStack(data) {
  return CircularStackEntry(
    [
      CircularSegmentEntry(
        data['price'],
        Colors.red[200],
        rankKey: 'price',
      ),
      CircularSegmentEntry(
        data['volume'],
        Colors.green[200],
        rankKey: 'volume',
      ),
      CircularSegmentEntry(
        data['priceUsd'],
        Colors.yellow[200],
        rankKey: 'priceUsd',
      ),
    ],
  );
}
