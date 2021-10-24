import 'dart:math';

import 'package:flutter/cupertino.dart';

abstract class Meal {
  late GlobalKey id;
  late String name;
  late List<Addons> addons;
  double? price;

  selectionList();

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

  set selected(bool select) {
    this._checked = select;
  }

  String get addonName => this._name;
  bool get addonSelected => this._checked;
}
