import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/pages/home/home.view.dart';
import 'package:learning_flutter/app/pages/portal/portal.view.dart';
import 'package:learning_flutter/app/pages/settings/index.dart';
import 'package:learning_flutter/app/routes.dart';
import 'package:learning_flutter/app/shared/services/user/user.service.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  lightTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      brightness: Brightness.light,
    );
  }

  darkTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Colors.blue,
      brightness: Brightness.dark,
    );
  }

  Brightness mode;

  isLight() {
    return mode == Brightness.light;
  }

  void switchTheme(Brightness mode) {
    if (this.mode != mode) {
      setState(() {
        this.mode = mode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // The setting should be available after user is logged in
    return StreamBuilder(
        stream: settingsBloc.settings.stream,
        builder: (context, AsyncSnapshot<SettingsModel> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data;
          mode = data.darkMode ? Brightness.dark : Brightness.light;
          final _themeData = mode == Brightness.dark ? darkTheme : lightTheme;
          return ThemeSwitcher(
            data: this,
            child: MaterialApp(
              theme: _themeData(context),
              title: AppplicationConstants.appName,
              supportedLocales: [
                const Locale('en'),
                const Locale('ar'),
              ],
              routes: routes,
              home: FutureBuilder(
                future: User().isAuthenticated(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return snapshot.data == true ? HomeView() : PortalView();
                },
              ),
            ),
          );
        });
  }
}

class ThemeSwitcher extends InheritedWidget {
  final _AppState data;

  const ThemeSwitcher({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static _AppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ThemeSwitcher)
            as ThemeSwitcher)
        .data;
  }

  @override
  bool updateShouldNotify(ThemeSwitcher old) {
    return this != old;
  }
}
