import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/core/helpers/storage.dart';
import 'package:learning_flutter/app/locator.dart';

class TokenHelper {
  final _storage = locator<Storage>();
  Future<void> removeToken() {
    return _storage.remove(AppplicationConstants.tokenKey);
  }

  Future<void> setToken(String token) {
    return _storage.set(AppplicationConstants.tokenKey, token);
  }

  Future<String> getToken() {
    return _storage.get(AppplicationConstants.tokenKey);
  }
}
