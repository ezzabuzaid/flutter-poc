import 'package:learning_flutter/app/core/bloc.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';

class HomeBloc {
  final meals = Bloc<List<MealsModel>>();
  getMealsByMenuId(menuId) {
    meals.sink.addStream(mealsBloc.fetchMeals(menuId));
  }
}

// TODO: much selling Endpoint
final homeBloc = HomeBloc();
