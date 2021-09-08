import 'package:flutter/material.dart';
import 'package:foodtruck/test/widget_test.dart';

import 'MealCard.dart';

class MainDisplay extends StatelessWidget {
  const MainDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: demoMeals.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 10,
          crossAxisSpacing: 40,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) => GestureDetector(
          child: MealCard(
            index: index,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
