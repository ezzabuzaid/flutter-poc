import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/app/partials/logo.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AboutDialog(
      children: <Widget>[Logo()],
      applicationName: 'Buildozer',
      applicationVersion: '1.0.0',
      applicationLegalese:
          'You can do anything as you like, it\'s open source dude ^^',
    );
  }
}
