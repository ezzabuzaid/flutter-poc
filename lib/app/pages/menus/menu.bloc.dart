import 'dart:async';

import 'package:learning_flutter/app/pages/meals/meal.model.dart';
import 'package:learning_flutter/app/pages/menus/menu.service.dart';

class MenuBloc {
  final _service = MenusService();
  Stream<List<MealsModel>> fetchMeals() {
    return _service.fetchMenus().asStream();
  }
}

final menuBloc = MenuBloc();
