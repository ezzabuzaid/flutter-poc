import 'package:learning_flutter/app/core/bloc.dart';
import 'menus.model.dart';
import 'menus.service.dart';

class MenuBloc {
  final menus = Bloc<List<MenusModel>>();
  fetchMenus() {
    menus.sink.addStream(menusService.fetchMenus().asStream());
  }
}

final menuBloc = MenuBloc();
