import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => LocalAuthenticationService());
}

class LocalAuthenticationService {
  final _auth = LocalAuthentication();
  bool isProtectionEnabled = false;

  // NOTE: save this in the storage and let the user choice to use this authentication or not
  bool isAuthenticated = false;

  Future<void> authenticate() async {
    if (isProtectionEnabled) {
      try {
        isAuthenticated = await _auth.authenticateWithBiometrics(
          localizedReason: 'authenticate to access',
          useErrorDialogs: true,
          stickyAuth: true,
        );
      } on PlatformException catch (e) {
        logger.e(e);
      }
    }
  }
}
