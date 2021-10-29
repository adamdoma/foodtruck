import 'package:foodtruck/classes/meal.dart';

class Toast extends Meal {
  List<String> _typeOfBread = ["פיתה", "לחמניה", "טורטיה"];
  List<String> _typeOfMeat = ['בשר', 'עוף', 'גבינה'];
  @override
  selectionList() {
    return _typeOfBread;
  }

  @override
  subSelection() {
    return _typeOfMeat;
  }
}
