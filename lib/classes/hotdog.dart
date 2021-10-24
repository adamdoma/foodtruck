import 'package:foodtruck/classes/meal.dart';

class HotDog extends Meal {
  List<String> _typeOfBread = ["פיתה", "בגט", "ג'בטה"];

  @override
  selectionList() {
    return _typeOfBread;
  }
}