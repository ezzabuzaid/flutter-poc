import 'package:learning_flutter/core/index.dart';
import 'package:learning_flutter/pages/meals/meal.model.dart';
import 'package:learning_flutter/shared/response.dart';

class MealsService {
  Future<Response<MealsModel>> fetchMeals() async {
    final response = await http.get('meals');
    return test<MealsModel>(response.body, MealsModel);
  }
}

Response<T> test<T>(body, inst) {
  final decodedResponse = Response.fromJson(body);
  decodedResponse.data = inst.fromJson(decodedResponse.data);
  return decodedResponse;
}
