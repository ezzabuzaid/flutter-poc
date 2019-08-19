import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class BugFix {
  final double number;
  final String author;
  final String comment;
  const BugFix({this.number, this.author, this.comment});
  f() {
    logger.e(this.number);
  }
}

// REVIEW Storage && Service Locator
@BugFix(number: 1000000000000000000000)
class LocalAuthenticationService {
  final _auth = LocalAuthentication();
  final canCheckBiometrics = LocalAuthentication().canCheckBiometrics;
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
