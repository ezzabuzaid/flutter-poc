import 'package:flutter/widgets.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/pages/meals/meals.service.dart';

class MealsBloc with ChangeNotifier {
  List<MealsModel> meals = [];
  fetchMeals() async {
    this.meals = await mealsService.fetchMeals();
    notifyListeners();
  }

  toggleMealFavState(MealsModel meal, int index) {
    // TODO: update fav meal status here
    notifyListeners();
  }
}
