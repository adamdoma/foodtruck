import 'package:foodtruck/classes/meal.dart';

class Kebab extends Meal {
  List<String> _typeOfBread = ["פיתה", "בגט", "ג'בטה"];

  @override
  selectionList() {
    return _typeOfBread;
  }

  @override
  subSelection() {
    // TODO: implement subSelection
    throw UnimplementedError();
  }
}
