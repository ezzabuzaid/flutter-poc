import 'package:get_it/get_it.dart';
import 'package:learning_flutter/app/core/auth.service.dart';
import 'package:learning_flutter/app/pages/home/home.bloc.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/pages/menus/index.dart';
import 'package:learning_flutter/app/pages/settings/settings.bloc.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(LocalAuthenticationService());
  locator.registerSingleton(MenusService());
  locator.registerSingleton(MealsService());
  locator.registerSingleton(HomeBloc());
  locator.registerSingleton(MealsBloc());
  locator.registerSingleton(SettingsBloc());
}
