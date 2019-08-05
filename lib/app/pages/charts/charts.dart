import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:learning_flutter/app/pages/charts/charts.model.dart';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';

final channel =
    IOWebSocketChannel.connect('wss://ws.coincap.io/trades/binance');

class ChartView extends StatefulWidget {
  @override
  _ChartViewState createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  StreamSubscription _streamSubscription;
  @override
  void initState() {
    this._streamSubscription = channel.stream.listen((value) {
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
    super.deactivate();
  }

  @override
  void dispose() {
    this._streamSubscription.cancel();
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
