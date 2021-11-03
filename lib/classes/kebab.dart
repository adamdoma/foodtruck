import 'package:foodtruck/classes/meal.dart';

class Kebab extends Meal {
  List<String> _typeOfBread = ["פיתה", "בגט", "ג'בטה"];

  Kebab(String name) : super(name);

  @override
  selectionList() {
    return _typeOfBread;
  }

  @override
  subSelection() {
    // TODO: implement subSelection
    throw UnimplementedError();
  }

  @override
  calculatePrice() {
    // TODO: implement calculatePrice
    throw UnimplementedError();
  }
}
