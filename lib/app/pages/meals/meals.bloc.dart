import 'package:learning_flutter/app/pages/meals/meal.model.dart';
import 'package:learning_flutter/app/pages/meals/meal.service.dart';
import 'package:learning_flutter/app/shared/response.dart';
import 'package:rxdart/rxdart.dart';

class MealBloc {
  final _service = MealsService();
  final _subject = BehaviorSubject<List<MealsModel>>();
  getUser() async {
    var response = await _service.fetchMeals();
    _subject.sink.add(response);
  }
}
