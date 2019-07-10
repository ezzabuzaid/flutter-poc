import 'package:learning_flutter/app/core/http.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/shared/response.dart';

class MenusService {
  Future<List<MealsModel>> fetchMenus() async {
    final response = await http.get('menus');
    return serilaizeList(response.body, MealsModel);
  }
}

serilaizeList(body, model) {
  final decoded = Response.fromJson(body);
  List data = List.from(decoded.data);
  return data.map((json) => model.fromJson(json as dynamic)).toList();
}
