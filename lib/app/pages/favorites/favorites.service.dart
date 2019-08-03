import 'package:learning_flutter/app/core/constants.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/http.dart';
import 'package:learning_flutter/app/pages/favorites/index.dart';
import 'package:learning_flutter/app/pages/meals/meals.model.dart';
import 'package:learning_flutter/app/shared/response.dart';

class FavoritesService {
  Future<List<MealsModel>> fetchFavoritesMeals() async {
    logger.d(ApiConstants.FAVORITES_MEALS);
    final response = await http.get(ApiConstants.FAVORITES_MEALS);
    final decoded = Response<FavoritesModel>.fromJson(response.body);
    logger.d(decoded.toJson());
    List data = List.from(decoded.data);
    return data.map((json) => MealsModel.fromJson(json as dynamic)).toList();
  }

  addToFavoritesMeals(FavoritesModel payload) {
    return http.post(ApiConstants.FAVORITES_MEALS, body: payload.toJson());
  }
}
