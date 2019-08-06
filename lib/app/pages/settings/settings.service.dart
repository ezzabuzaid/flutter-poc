import 'package:learning_flutter/app/core/http.dart';
import 'package:learning_flutter/app/pages/settings/index.dart';
import 'package:learning_flutter/app/shared/response.dart';

class SettingsService {
  Future<List<SettingsModel>> fetchSettings() async {
    final response = await http.get('Settings');
    final decoded = Response.fromJson(response.body);
    List data = List.from(decoded.data);
    return data.map((json) => SettingsModel.fromJson(json as dynamic)).toList();
  }

  Future<List<SettingsModel>> fetchSettingsByMenuId(String menuId) async {
    final response = await http.get('Settings/menu/$menuId');
    final decoded = Response.fromJson(response.body);
    List data = List.from(decoded.data);
    return data.map((json) => SettingsModel.fromJson(json as dynamic)).toList();
  }
}
