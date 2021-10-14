import 'package:flutter/material.dart';

import 'meal.dart';

class Cart extends ChangeNotifier {
  List<Meal> imgList = [];

  List<Meal> getList() {
    return this.imgList;
  }

  void addMeal(Meal meal) {
    imgList.add(meal);
    notifyListeners();
  }

  void deleteMeal(int index) {}
}
