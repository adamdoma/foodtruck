import 'package:foodtruck/classes/meal.dart';

class Toast extends Meal {
  List<String> _typeOfBread = ["פיתה", "לחמניה", "טורטיה"];
  List<String> _typeOfMeat = ['בשר', 'עוף', 'גבינה'];

  Toast(String name) : super(name);

  @override
  selectionList() {
    return _typeOfBread;
  }

  @override
  subSelection() {
    return _typeOfMeat;
  }

  @override
  calculatePrice() {
    // TODO: implement calculatePrice
    throw UnimplementedError();
  }
}
