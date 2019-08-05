import 'package:learning_flutter/app/pages/favorites/index.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:rxdart/subjects.dart';

class _FavoritesBloc {
  final subject = BehaviorSubject<List<MealsModel>>();

  BehaviorSubject<List<MealsModel>> fetchFavorites() {
    final response = favoritesService.fetchFavoritesMeals().asStream().cast<List<MealsModel>>();
    subject.addStream(response);
    return this.subject;
  }

  dispose() {
    subject.close();
  }
}

final favoritesBloc = _FavoritesBloc();
