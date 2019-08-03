import 'dart:async';

import 'package:learning_flutter/app/pages/meals/meals.model.dart';
import 'package:learning_flutter/app/pages/meals/meals.service.dart';

class MealBloc {
  final _service = MealsService();
  Stream<List<MealsModel>> fetchMeals(String menuId) {
    if (menuId != null) {
      return _service.fetchMealsByMenuId(menuId).asStream();
    }
    return _service.fetchMeals().asStream();
  }
}

final mealsBloc = MealBloc();
