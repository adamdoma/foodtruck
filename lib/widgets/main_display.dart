import 'package:flutter/material.dart';
import 'package:foodtruck/screens/mealDetails.dart';
import 'package:foodtruck/test/widget_test.dart';

import 'MealCard.dart';

class MainDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        itemCount: demoMeals.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          mainAxisSpacing: 5,
          crossAxisSpacing: 20,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) => GestureDetector(
          child: MealCard(
            index: index,
          ),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                reverseTransitionDuration: Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondAnimation) =>
                    FadeTransition(
                  opacity: animation,
                  child: MealDetails(meal: index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
