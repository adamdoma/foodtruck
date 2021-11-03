import 'meal.dart';

class Chicken extends Meal {
  List<String> _typeOfBread = ["פיתה", "בגט", "ג'בטה", "עגולה"];

  Chicken(String name) : super(name);

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
