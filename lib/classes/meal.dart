import 'dart:math';

import 'package:flutter/material.dart';

class Meal {
  int? id;
  // List<Addons>? addons;
  double? price;

  Meal() {
    id = Random().nextInt(999999999);
  }

  int? getTagName() {
    return this.id;
  }
}

class Addons {
  late String name;
  late bool checked;
}
