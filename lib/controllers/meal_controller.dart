import 'package:flutter/cupertino.dart';
import 'package:foodtruck/classes/burger.dart';
import 'package:foodtruck/classes/chicken.dart';
import 'package:foodtruck/classes/hotdog.dart';
import 'package:foodtruck/classes/kebab.dart';
import 'package:foodtruck/classes/meal.dart';
import 'package:foodtruck/classes/salads.dart';
import 'package:foodtruck/classes/toast.dart';

class MealController extends ChangeNotifier {
  late dynamic meal;

  String getName(String name) {
    name = name.substring(13, name.length - 7);
    return name;
  }

  Meal returnType(String name) {
    switch (getName(name)) {
      case "burger":
        {
          return new Burger(name);
        }
      case "chicken":
        {
          return new Chicken(name);
        }
      case "kebab":
        {
          return new Kebab(name);
        }
      case "toast":
        {
          return new Toast(name);
        }
      case "hotdog":
        {
          return new HotDog(name);
        }
      case "salads":
        {
          return new Salads(name);
        }
      default:
        {
          print("----------------------------------------------");
          print('mealController type class error');
          print("----------------------------------------------");
          throw Error();
        }
    }
  }

  void handleAddonSelection(dynamic meal, int index) {
    meal.addons[index].setSelected(!meal.addons[index].addonSelected);
    notifyListeners();
  }
}
