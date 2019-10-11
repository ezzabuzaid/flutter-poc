import 'package:flutter/material.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/pages/meals/meals.model.dart';
import 'package:learning_flutter/app/pages/menus/menus.model.dart';
import 'package:learning_flutter/app/pages/menus/menus.service.dart';

class HomeBloc with ChangeNotifier {
  int menuIndex = 0;
  List<MenusModel> menus = [];
  List<MealsModel> meals = [];

  changeMenu(int index) async {
    menuIndex = index;
    this.meals = await mealsService.fetchMealsByMenuId(menus[index].sId);
    notifyListeners();
  }

  fetchMenus() async {
    this.menus = await menusService.fetchMenus();
    notifyListeners();
  }
}
