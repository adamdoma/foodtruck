import 'package:foodtruck/classes/meal.dart';

class HotDog extends Meal {
  List<String> _typeOfBread = ["פיתה", "בגט", "ג'בטה"];

  HotDog(String name) : super(name);

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
