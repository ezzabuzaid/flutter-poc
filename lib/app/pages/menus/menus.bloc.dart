import 'package:learning_flutter/app/core/helpers/bloc/bloc.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/shared/services/menus.service.dart';
import 'menus.model.dart';
import 'package:learning_flutter/app/pages/menus/menus.model.dart';

class MenuBloc {
  final menus = Bloc<List<MenusModel>>();
  final menusService = locator<MenusService>();
  fetchMenus() {
    menus.sink.addStream(menusService.fetchMenus().asStream());
  }
}

final menuBloc = MenuBloc();
