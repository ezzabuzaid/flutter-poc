import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_flutter/app/core/auth.service.dart';
import 'package:learning_flutter/app/core/helpers/storage.dart';
import 'package:learning_flutter/app/core/helpers/token.dart';
import 'package:learning_flutter/app/pages/home/home.bloc.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/pages/settings/settings.bloc.dart';
import 'package:learning_flutter/app/shared/models/portal.model.dart';
import 'package:learning_flutter/app/shared/services/menus.service.dart';
import 'package:learning_flutter/app/shared/services/user/user.service.dart';
import 'package:mockito/mockito.dart';

GetIt locator = GetIt();

// TODO: Create base class to include the child class in the locator directly
void setupLocator() {
  // REVIEW Locator has one critical issue which is cannot know which class depends on another so it should be order depend on that
  // TODO: try to make function like `locateMe()` inside each class that should be singelton
  locator.registerSingleton(Storage());
  locator.registerSingleton(TokenHelper());
  locator.registerSingleton<UserService>(UserService());
  locator.registerSingleton(Geolocator());
  locator.registerSingleton(LocalAuthenticationService());
  locator.registerSingleton(MenusService());
  locator.registerSingleton(MealsService());
// FIXME: Bloc's shouldn't be used in get it
  locator.registerSingleton(HomeBloc());
  locator.registerSingleton(MealsBloc());
  locator.registerSingleton(SettingsBloc());
}

class MockUserService extends Mock implements UserService {}
class MockMealsService extends Mock implements MealsService {}
class MockStorage extends Mock implements Storage {}
class MockMenusService extends Mock implements MenusService {}

void setupMockLocator() {
  // locator.registerSingleton<Storage>(MockStorage());
  // locator.registerSingleton(TokenHelper());
  locator.registerSingleton<UserService>(MockUserService());
  // locator.registerSingleton(Geolocator());
  // locator.registerSingleton(LocalAuthenticationService());
  // locator.registerSingleton<MenusService>(MenusService());
  // locator.registerSingleton<MealsService>(MealsService());
// FIXME: Bloc's shouldn't be used in get it
  // locator.registerSingleton(HomeBloc());
  // locator.registerSingleton(MealsBloc());
  // locator.registerSingleton(SettingsBloc());
// locator.registerSingleton(HomeBloc());
  // locator.registerSingleton(MealsBloc());
  // locator.registerSingleton(SettingsBloc());
}
