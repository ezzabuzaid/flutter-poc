// NOTE setup the environment logic here
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/app/app.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(App()));
}
