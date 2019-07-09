import 'package:learning_flutter/app/core/http.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/shared/response.dart';

class MealsService {
  Future<List<MealsModel>> fetchMeals() async {
    final response = await http.get('meals');
    final decoded = Response.fromJson(response.body);
    List data = List.from(decoded.data);
    return data.map((json) => MealsModel.fromJson(json as dynamic)).toList();
  }
}

// Response<T> test<T>(response, j) {
//   final decodedResponse = Response<T>.fromJson(response.body);
//   List<T> data = decodedResponse.data.map((i) => j.fromJson(i)).toList();
//   decodedResponse.data = data;
//   return decodedResponse;
// }
