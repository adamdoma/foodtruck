import 'package:flutter/material.dart';
import 'package:foodtruck/controllers/home_controller.dart';
import 'package:provider/provider.dart';

import '../models/MealCard.dart';
import '../models/userInfo.dart';
import '../test/widget_test.dart';

class HomeScreen extends StatelessWidget {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 600),
                top: 3,
                child: UserInfo(),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 600),
                top: Provider.of<HomeController>(context, listen: true)
                            .homeState ==
                        HomeState.info
                    ? 500
                    : 100,
                left: 5,
                right: 5,
                bottom: 0,
                child: Container(
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
                      onTap: () {
                        print("=-=============================");
                        print(
                            Provider.of<HomeController>(context, listen: false)
                                .homeState
                                .toString());
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        });
      },
    );
  }
}
