import 'package:learning_flutter/app/core/http/index.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/shared/models/response.dart';

class MealsService {
  Future<List<MealsModel>> fetchMeals() async {
    final response = await http.get('meals');
    final decoded = Response.fromJson(response.body);
    List data = List.from(decoded.data);
    return data.map((json) => MealsModel.fromJson(json as dynamic)).toList();
  }

  Future<List<MealsModel>> fetchMealsByMenuId(String menuId) async {
    final response = await http.get('meals/menu/$menuId');
    final decoded = Response.fromJson(response.body);
    List data = List.from(decoded.data);
    return data.map((json) => MealsModel.fromJson(json as dynamic)).toList();
  }
}

final mealsService = MealsService();
