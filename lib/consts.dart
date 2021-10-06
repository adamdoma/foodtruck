import 'package:flutter/material.dart';

final Color textColor = Colors.white.withOpacity(0.6);

final LinearGradient boxLinearGradient = LinearGradient(colors: [
  Colors.blueGrey.withOpacity(0.3),
  Colors.blueGrey.withOpacity(0.32),
  Colors.blueGrey.withOpacity(0.33),
  Colors.blueGrey.withOpacity(0.34),
  Colors.blueGrey.withOpacity(0.35)
], begin: Alignment.topLeft, end: Alignment.bottomRight);

final LinearGradient boxLinearGradientLite = LinearGradient(colors: [
  Colors.white.withOpacity(0.8),
  Colors.white.withOpacity(0.7),
  Colors.white.withOpacity(0.6),
  Colors.white.withOpacity(0.5),
  Colors.white.withOpacity(0.4),
], begin: Alignment.topLeft, end: Alignment.bottomRight);
