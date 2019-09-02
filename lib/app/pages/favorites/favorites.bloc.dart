import 'package:learning_flutter/app/core/helpers/bloc/bloc.dart';
import 'package:learning_flutter/app/pages/favorites/index.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';

class _FavoritesBloc {
  final favorites = Bloc<List<FavoritesModel<MealsModel>>>();

  void fetchFavorites() async {
    final response = await favoritesService.fetchFavoritesMeals();
    favorites.sink.add(response);
  }

  Future addToFavoritesMeals(FavoritesModel payload) {
    return favoritesService.addToFavoritesMeals(payload);
  }
}

final favoritesBloc = _FavoritesBloc();
