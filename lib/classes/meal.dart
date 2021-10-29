import 'package:flutter/cupertino.dart';

abstract class Meal {
  late GlobalKey id;
  late String name;
  late List<Addons> addons = [
    Addons('סלט'),
    Addons('מלפפון חמוץ'),
    Addons('כרוב רבן'),
    Addons('קרוב אדום'),
    Addons('בצל'),
    Addons('חסה')
  ];
  double? price;

  selectionList();
  subSelection();

  Meal() {
    id = new GlobalKey();
  }

  GlobalKey getTagName() {
    return this.id;
  }
}

class Addons {
  late String _name;
  bool _checked = false;

  Addons(String name) {
    this._name = name;
  }

  set addonName(String name) {
    this._name = name;
  }

  void setSelected(bool select) {
    this._checked = select;
  }

  String get addonName => this._name;
  bool get addonSelected => this._checked;
}
