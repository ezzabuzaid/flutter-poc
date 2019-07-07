import 'package:learning_flutter/pages/meals/index.dart';
import 'package:learning_flutter/pages/meals/meal.service.dart';
import 'package:learning_flutter/shared/response.dart';
import 'package:rxdart/rxdart.dart';

class MealBloc {
  final _service = MealsService();
  final _subject = BehaviorSubject<Response<MealsModel>>();
  getUser() async {
    var response = await _service.fetchMeals();
    _subject.sink.add(response);
  }
}
