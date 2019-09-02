import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants/index.dart';
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
