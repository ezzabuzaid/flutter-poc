import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/pages/home/home.view.dart';
import 'package:learning_flutter/app/pages/portal/portal.view.dart';
import 'package:learning_flutter/app/pages/settings/index.dart';
import 'package:learning_flutter/app/routes.dart';
import 'package:learning_flutter/app/shared/services/user/user.service.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  // TODO: theme functions should be moved to another class
  static final settingBloc = locator<SettingsBloc>();

  App({Key key}) : super(key: key) {
    // settingBloc.getSettings();
  }

  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      brightness: Brightness.light,
      indicatorColor: Colors.red,
    );
  }

  ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Colors.blue,
      brightness: Brightness.dark,
    );
  }

  static Brightness get brightness => settingBloc.settings.darkMode ? Brightness.dark : Brightness.light;

  static isLight() {
    return brightness == Brightness.light;
  }

  static switchTheme() {
    settingBloc.switchTheme();
  }

  ThemeData prepareTheme(BuildContext context, bool darkMode) {
    final theme = brightness == Brightness.dark ? darkTheme : lightTheme;
    return theme(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: The setting should be available after user is logged in
    // return ChangeNotifierProvider<SettingsBloc>(
    //   builder: (_) => settingBloc,
    //   child: Selector<SettingsBloc, bool>(
    //     selector: (buildContext, bloc) {
    //       return bloc.settings.darkMode;
    //     },
    //     builder: (context, darkMode, child) {

    //     },
    //   ),
    // );
    return MaterialApp(
      theme: prepareTheme(context, false),
      title: AppplicationConstants.appName,
      supportedLocales: [
        // TODO: setup localization
        const Locale('en'),
        const Locale('ar'),
      ],
      routes: routes,
      home: Scaffold(
        body: FutureProvider<bool>(
          updateShouldNotify: (z, x) => true,
          catchError: (context, error) => false,
          initialData: false,
          builder: (BuildContext context) => locator<UserService>().isAuthenticated(),
          child: Consumer<bool>(
            builder: (context, isAuthenticated, child) {
              return isAuthenticated ? HomeView() : PortalView();
            },
          ),
        ),
      ),
    );
  }
}
