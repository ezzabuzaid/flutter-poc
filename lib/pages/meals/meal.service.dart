import 'dart:convert';
import 'package:http/http.dart';
import 'package:learning_flutter/core/index.dart';
import 'package:learning_flutter/pages/meals/meal.model.dart';

class MealsService {
  Future<MealsModel> fetchMeals() async {
    final response = await get('http://10.0.2.2:8080/api/meals');
    print(response.body);
    return MealsModel.fromJson(json.decode(response.body));
  }
}
