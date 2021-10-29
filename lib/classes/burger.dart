import 'package:foodtruck/classes/meal.dart';

class Burger extends Meal {
  List<int> _gram = [100, 150, 220];
  bool _cheese = false;

  get cheeseAddon => this._cheese;

  @override
  selectionList() {
    return _gram;
  }

  @override
  subSelection() {
    // TODO: implement subSelection
    throw UnimplementedError();
  }
}
