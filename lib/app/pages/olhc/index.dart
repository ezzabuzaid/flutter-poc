import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants.dart';
import 'package:learning_flutter/app/layout/navigation.dart';
import 'package:learning_flutter/app/layout/toolbar.dart';
import 'package:learning_flutter/app/pages/olhc/ohlc-chart.dart';
import 'package:learning_flutter/app/pages/olhc/olhc-list.dart';

export './olhc-list.dart';
export './olhc.model.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          title: Text('List'),
          icon: GestureDetector(
            child: Icon(Icons.list),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                RoutesConstants.OLHC,
              );
            },
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Chart'),
          icon: GestureDetector(
            child: Icon(Icons.multiline_chart),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                RoutesConstants.OLHC_CHART,
              );
            },
          ),
        ),
      ],
    );
  }
}

class OLHCListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OHLC(),
      appBar: Toolbar(title:'OLHC List',
        context: context,),
      drawer: Navigation(),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class OHLCCandleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OHLCCandle(),
      appBar: Toolbar(title:'OLHC Chart',
        context: context,),
      drawer: Navigation(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
