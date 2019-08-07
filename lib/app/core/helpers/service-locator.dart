import 'package:get_it/get_it.dart';
import 'package:learning_flutter/app/core/auth.service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => LocalAuthenticationService());
}
