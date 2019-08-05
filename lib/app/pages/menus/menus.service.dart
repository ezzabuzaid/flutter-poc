import '../../core/http.dart';
import '../../shared/response.dart';
import 'menus.model.dart';

class MenusService {
  Future<List<MenusModel>> fetchMenus() async {
    final response = await http.get('menus');
    // return serilaizeList(response.body, MealsModel);
    final decoded = Response.fromJson(response.body);
    List data = List.from(decoded.data);
    return data.map((json) => MenusModel.fromJson(json as dynamic)).toList();
  }
}

serilaizeList(body, model) {
  final decoded = Response.fromJson(body);
  List data = List.from(decoded.data);
  return data.map((json) => model.fromJson(json as dynamic)).toList();
}