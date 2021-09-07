import 'package:flutter/material.dart';

final Color textColor = Colors.white.withOpacity(0.6);

double info = 80;
double cart = 40;

final LinearGradient boxLinearGradient = LinearGradient(colors: [
  Colors.deepPurpleAccent.withOpacity(0.2),
  Colors.deepPurpleAccent.withOpacity(0.22),
  Colors.deepPurpleAccent.withOpacity(0.23),
  Colors.deepPurpleAccent.withOpacity(0.24),
  Colors.deepPurpleAccent.withOpacity(0.25)
], begin: Alignment.topLeft, end: Alignment.bottomRight);

final LinearGradient boxLinearGradientLite = LinearGradient(colors: [
  Colors.white.withOpacity(0.8),
  Colors.white.withOpacity(0.7),
  Colors.white.withOpacity(0.6),
  Colors.white.withOpacity(0.5),
  Colors.white.withOpacity(0.4),
], begin: Alignment.topLeft, end: Alignment.bottomRight);
