import 'package:learning_flutter/app/core/http.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/shared/response.dart';

class MealsService {
  Future<List<MealsModel>> fetchMeals() async {
    final response = await http.get('meals');
    final x = test<List<MealsModel>>(response.body, MealsModel);
    print('this image is ${x.data[0].image}');
    return x.data;
  }
}

Response<T> test<T>(String body, inst) {
  final decodedResponse = Response.fromJson(body);
  decodedResponse.data = inst.fromJson(decodedResponse.data);
  return decodedResponse;
}
