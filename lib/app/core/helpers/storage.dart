import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  final _storage = SharedPreferences.getInstance();

  /// Get specific field
  Future<String> get(String key) async {
    return (await _storage).getString(key);
  }

  Future<void> set(String key, String payload) async {
    return (await _storage).setString(key, payload);
  }

  /// Remove specific field
  Future<void> remove(String key) async {
    return (await _storage).remove(key);
  }

  /// Remove all storage
  Future<void> clear(String key) async {
    return (await _storage).clear();
  }
}
