import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<int> imgList = [];

  List getList() {
    return this.imgList;
  }

  void addMeal(int img) {
    imgList.add(img);
    notifyListeners();
  }

  void deleteMeal(int index) {}
}
