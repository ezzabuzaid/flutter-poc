import 'package:learning_flutter/app/core/helpers/storage.dart';

const token_key = 'token';

class TokenHelper {
  factory TokenHelper() => const TokenHelper._internal();
  const TokenHelper._internal();

  Future<void> removeToken() async {
    return await Storage().remove(token_key);
  }

  Future<void> addToken(String token) async {
    return await Storage().set(token_key, token);
  }

  Future<String> getToken() async {
    return await Storage().get(token_key);
  }
}
