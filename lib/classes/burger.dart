import 'package:foodtruck/classes/meal.dart';

class Burger extends Meal {
  List<int> _gram = [100, 150, 220];
  bool _cheese = false;

  get burgerSizeList => this._gram;
  get cheeseAddon => this._cheese;
}
