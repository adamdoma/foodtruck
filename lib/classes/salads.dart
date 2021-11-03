import 'meal.dart';

class Salads extends Meal {
  List<String> _type = ["עוף", "קריספי", "פוטטו", "בשר"];

  Salads(String name) : super(name);

  @override
  calculatePrice() {
    // TODO: implement calculatePrice
    throw UnimplementedError();
  }

  @override
  selectionList() {
    return _type;
  }

  @override
  subSelection() {
    // TODO: implement subSelection
    throw UnimplementedError();
  }
}
