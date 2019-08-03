import 'dart:async';

import 'package:learning_flutter/app/pages/favorites/index.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';

class MealBloc {
  final _service = FavoritesService();
  Stream<List<MealsModel>> fetchFavorites() {
    return _service.fetchFavoritesMeals().asStream();
  }
}

final favoritesBloc = MealBloc();
