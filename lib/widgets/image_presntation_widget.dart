import 'package:flutter/material.dart';
import 'package:foodtruck/test/widget_test.dart';

class ImagePresntation extends StatelessWidget {
  late final int index;

  ImagePresntation({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 20, offset: Offset(5, 5))
        ],
        border: Border.all(color: Colors.transparent, width: 2),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(demoMeals[index].toString()),
        ),
      ),
    );
  }
}
