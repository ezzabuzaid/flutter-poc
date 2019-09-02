import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/core/http/index.dart';
import 'package:learning_flutter/app/pages/favorites/index.dart';
import 'package:learning_flutter/app/shared/response.dart';
import 'package:learning_flutter/app/pages/meals/meals.model.dart';

class _FavoritesService {
  Future fetchFavoritesMeals() async {
    final response = await http.get(ApiConstants.FAVORITES_MEALS);
    final decoded = Response.fromJson(response.body);
    print(decoded.data);
    final data = List<FavoritesModel<MealsModel>>.from(
      decoded.data.map((x) {
        final m = FavoritesModel<MealsModel>.fromJson(x);
        m.items = MealsModel.fromJson(x['items']);
        return m;
      }),
    );
    return data;
  }

  Future addToFavoritesMeals(FavoritesModel payload) async {
    return http.post(ApiConstants.FAVORITES_MEALS, body: payload.toJson());
  }

  Future removeFromFavoritesMeals(String id) {
    return http.delete('${ApiConstants.FAVORITES}/$id');
  }
}

final favoritesService = _FavoritesService();
