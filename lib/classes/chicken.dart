import 'meal.dart';

class Chicken extends Meal {
  List<String> _typeOfBread = ["פיתה", "בגט", "ג'בטה", "עגולה"];

  @override
  selectionList() {
    return _typeOfBread;
  }
}
