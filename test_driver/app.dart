import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:learning_flutter/app/pages/login/login.view.dart';

void main() {
  enableFlutterDriverExtension();

  runApp(MaterialApp(home: LoginView()));
}
