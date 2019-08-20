import 'package:learning_flutter/app/core/bloc.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/pages/meals/meals.service.dart';

class _MealBloc {
  final meals = Bloc<List<MealsModel>>();
  fetchMeals(String menuId) async {
    Future<List<MealsModel>> result;
    if (menuId != null) {
      result = mealsService.fetchMealsByMenuId(menuId);
    } else {
      result = mealsService.fetchMeals();
    }
    meals.sink.add(await result);
  }
}

final mealsBloc = _MealBloc();
