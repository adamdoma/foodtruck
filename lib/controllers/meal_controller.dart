import 'package:foodtruck/classes/burger.dart';
import 'package:foodtruck/classes/chicken.dart';
import 'package:foodtruck/classes/hotdog.dart';
import 'package:foodtruck/classes/kebab.dart';
import 'package:foodtruck/classes/meal.dart';
import 'package:foodtruck/classes/toast.dart';

class MealController {
  String type;
  late String name;
  MealController({required this.type});

  String getName() {
    name = type.substring(13, type.length - 7);
    return name;
  }

  dynamic retrunType() {
    getName();
    switch (name) {
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
}
