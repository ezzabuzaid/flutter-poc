import 'dart:async';

import 'package:learning_flutter/app/pages/meals/meal.model.dart';
import 'package:learning_flutter/app/pages/meals/meal.service.dart';

class MealBloc {
  final _service = MealsService();
  Stream<List<MealsModel>> fetchMeals() {
    return _service.fetchMeals().asStream();
  }

  // fetchMeals() async {
  //   var response = await _service.fetchMeals();
  //   mealsSubject.sink.add(response);
  // }

}

final mealsBloc = MealBloc();
