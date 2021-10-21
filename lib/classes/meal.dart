import 'dart:math';

import 'package:flutter/material.dart';

class Meal {
  int? id;
  late String name;
  List<Addons>? addons;
  double? price;

  Meal() {
    id = Random().nextInt(999999999);
  }

  int? getTagName() {
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
