import 'dart:async';
import 'package:learning_flutter/app/pages/menus/menu.service.dart';
import 'package:learning_flutter/app/pages/menus/menus.model.dart';

class MenuBloc {
  final _service = MenusService();
  Stream<List<MenusModel>> fetchMeals() {
    return _service.fetchMenus().asStream();
  }
}

final menuBloc = MenuBloc();
