import 'package:flutter/material.dart';
import '../models/MealCard.dart';
import '../test/widget_test.dart';
import '../models/userInfo.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Positioned(top: 3, child: UserInfo()),
          Positioned(
            top: 70,
            left: 5,
            right: 5,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                  child: MealCard(index: index),
                  onTap: () {
                    print(index);
                  },
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
