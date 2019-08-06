import 'package:flutter/material.dart';
import 'package:learning_flutter/app/pages/home/index.dart';
import 'package:learning_flutter/app/routes.dart';

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
      primarySwatch: Colors.amber,
      brightness: Brightness.dark,
    );
  }

  Brightness mode;

  void switchTheme(Brightness mode) {
    if (this.mode != mode) {
      setState(() {
        this.mode = mode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // favoritesService.fetchFavoritesMeals();
    final _themeData =
        mode == Brightness.dark ? this.darkTheme : this.lightTheme;
    return ThemeSwitcher(
      child: MaterialApp(
        theme: _themeData(context),
        title: 'Learning flutter',
        supportedLocales: [const Locale('en'), const Locale('ar')],
        routes: routes,
        home: HomeView(),
      ),
      data: this,
    );
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
