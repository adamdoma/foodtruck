import 'package:flutter/material.dart';
import '../classes/cart.dart';

class CartController extends ChangeNotifier {
  List<Cart> imgList = [];

  List<Cart> getList() {
    return this.imgList;
  }

  void addMeal(Cart item) {
    imgList.add(item);
    notifyListeners();
  }

  void deleteMeal(int index) {
    imgList.removeAt(index);
    notifyListeners();
  }
}
