import 'package:learning_flutter/app/core/constants.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/http.dart';
import 'package:learning_flutter/app/pages/favorites/index.dart';
import 'package:learning_flutter/app/pages/meals/meals.model.dart';
import 'package:learning_flutter/app/shared/response.dart';

class _FavoritesService {
  Future fetchFavoritesMeals() async {
    final response = await http.get(ApiConstants.FAVORITES_MEALS);
    final decoded = Response.fromJson(
      response.body,
    );
    logger.w(decoded.toJson());
    final data = List<FavoritesModel<MealsModel>>.from(decoded.data);
    final List<MealsModel> items = data.map((json) {
      final item = FavoritesModel<MealsModel>.fromJson(json as dynamic);
      logger.w(item);
      item.items = MealsModel.fromJson(json.items as dynamic);
      return item.items;
    }).toList();
    return items;
  }

  Future addToFavoritesMeals(FavoritesModel payload) {
    return http.post(ApiConstants.FAVORITES_MEALS, body: payload.toJson());
  }

  Future removeFromFavoritesMeals(String id) {
    return http.delete('${ApiConstants.FAVORITES}/$id');
  }
}

final favoritesService = _FavoritesService();
