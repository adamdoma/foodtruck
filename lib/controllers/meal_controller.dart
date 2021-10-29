import 'package:flutter/cupertino.dart';
import 'package:foodtruck/classes/burger.dart';
import 'package:foodtruck/classes/chicken.dart';
import 'package:foodtruck/classes/hotdog.dart';
import 'package:foodtruck/classes/kebab.dart';
import 'package:foodtruck/classes/meal.dart';
import 'package:foodtruck/classes/toast.dart';

class MealController extends ChangeNotifier {
  String _getName(String name) {
    name = name.substring(13, name.length - 7);
    return name;
  }

  Meal returnType(String name) {
    switch (_getName(name)) {
      case "burger":
        {
          return new Burger();
        }
      case "chicken":
        {
          return new Chicken();
        }
      case "kebab":
        {
          return new Kebab();
        }
      case "toast":
        {
          return new Toast();
        }
      case "hotdog":
        {
          return new HotDog();
        }
      default:
        {
          throw Error();
        }
    }
  }

  void handleAddonSelection(Meal meal, int index) {
    meal.addons[index].setSelected(!meal.addons[index].addonSelected);
    notifyListeners();
  }
}
