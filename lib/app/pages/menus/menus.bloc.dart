import 'dart:async';
import 'menus.model.dart';
import 'menus.service.dart';

class MenuBloc {
  final _service = MenusService();
  Stream<List<MenusModel>> fetchMeals() {
    return _service.fetchMenus().asStream();
  }
}

final menuBloc = MenuBloc();
