import 'package:flutter/widgets.dart';

import 'package:web_socket_channel/io.dart';

final channel =
    IOWebSocketChannel.connect('wss://ws.coincap.io/trades/binance');

class OLHC extends StatefulWidget {
  OLHC({Key key}) : super(key: key);

  _OLHCState createState() => _OLHCState();
}

class _OLHCState extends State<OLHC> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: channel.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('EURUSD'),
                      Text('23:57:43'),
                      Text('Spread: 39')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[Text('')],
                      )
                    ],
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
