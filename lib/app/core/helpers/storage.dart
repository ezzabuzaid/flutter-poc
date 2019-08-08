import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final _storage = FlutterSecureStorage();
  factory Storage() => Storage._internal();
  Storage._internal();

  /// Get specific field
  Future<String> get(String key) {
    return _storage.read(key: key);
  }

  Future<void> set(String key, String payload) {
    return _storage.write(key: key, value: payload);
  }

  /// Remove specific field
  Future<void> remove(String key) {
    return _storage.delete(key: key);
  }

  /// Remove all storage
  Future<void> clear(String key) {
    return _storage.deleteAll();
  }
}
