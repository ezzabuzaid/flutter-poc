import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/pages/olhc/ohlc.bloc.dart';
import 'package:learning_flutter/app/pages/olhc/olhc.model.dart';

class OHLC extends StatefulWidget {
  OHLC({Key key}) : super(key: key);
  _OHLCState createState() => _OHLCState();
}

getBetween(num value, from, to) {
  return value.toStringAsFixed(5).substring(from, to);
}

class _OHLCState extends State<OHLC> {
  final stream = ohlcBloc.connectToOhlcSocket();

  @override
  void initState() {
    super.initState();
  }

  calculateSpread(double high, double low) {
    return high - low;
  }

  formatDate() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<OLHCModel> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text(snapshot.hasError.toString());
          }
          final data = snapshot.data;
          final splitedDate = data.date.split(" ");
          final fullYear = splitedDate[0].split(".");
          final formattedFullYear = DateTime(
            int.parse(fullYear[0]),
            int.parse(fullYear[1]),
            int.parse(fullYear[2]),
          );
          getLastThreeDigit(double value) {
            return int.parse(getBetween(value, 4, 7)).toDouble();
          }

          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 7,
                ),
                child: Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'EURUSD',
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            splitedDate[1],
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            'Spread: ${calculateSpread(getLastThreeDigit(data.high), getLastThreeDigit(data.low))}',
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _MarketInfluence(
                            priceState: data.open,
                            marketPrice: data.low,
                            mode: "Low",
                          ),
                          _MarketInfluence(
                            priceState: data.close,
                            marketPrice: data.high,
                            mode: "High",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 2,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 0),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // _destroySocket();
    super.dispose();
  }
}

class _MarketInfluence extends StatefulWidget {
  final double priceState;
  final double marketPrice;
  final String mode;
  const _MarketInfluence({
    Key key,
    this.marketPrice,
    this.priceState,
    this.mode,
  }) : super(key: key);

  __MarketInfluenceState createState() => __MarketInfluenceState();
}

class __MarketInfluenceState extends State<_MarketInfluence> {
  Color color = Colors.blue.shade600;
  @override
  void didUpdateWidget(_MarketInfluence oldWidget) {
    color = oldWidget.marketPrice < widget.marketPrice
        ? Colors.blue.shade600
        : Colors.red.shade600;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              getBetween(widget.marketPrice, 0, 4),
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              getBetween(widget.marketPrice, 4, 6),
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.start,
            ),
            Align(
              alignment: Alignment.topCenter,
              heightFactor: 2.5,
              child: Text(
                getBetween(widget.marketPrice, 6, 7),
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Text(
              '${widget.mode}: ',
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              widget.priceState.toStringAsFixed(6),
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      ],
    );
  }
}
