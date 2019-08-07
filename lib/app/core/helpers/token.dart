import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

class TokenHelper {
  factory TokenHelper() => const TokenHelper._internal();
  const TokenHelper._internal();
  Future<void> removeToken() async {
    return await storage.delete(key: 'token');
  }

  Future<void> addToken(token) async {
    return await storage.write(key: 'token', value: token);
  }

  Future<String> getToken() async {
    return await storage.read(key: 'token');
  }
}
