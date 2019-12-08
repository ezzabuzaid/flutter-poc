// NOTE setup the environment logic here
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/app/app.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/locator.dart';

void main() async {
  bool isInDebugMode = false;

  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };
  // TODO: add crashlytics
  // await flutterCrashlytics.initialize();

  runZoned<Future<Null>>(
    () async {
      logger.i("Run The Applicaton");
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      setupLocator();
      runApp(App());
    },
    onError: (error, stackTrace) async {
      // Whenever an error occurs, call the `reportCrash` function. This will send
      // Dart errors to our dev console or Crashlytics depending on the environment.
      logger.e("An error has occured", error, stackTrace);
      // await flutterCrashlytics.reportCrash(
      //   error,
      //   stackTrace,
      //   forceCrash: false,
      // );
    },
  );
}
