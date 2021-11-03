import 'package:foodtruck/classes/meal.dart';

class Burger extends Meal {
  List<int> _gram = [100, 150, 220];
  bool _cheese = false;

  get cheeseAddon => this._cheese;

  Burger(String name) : super(name);

  @override
  selectionList() {
    return _gram;
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
