import 'package:flutter/material.dart';
import 'package:foodtruck/test/widget_test.dart';
import 'package:foodtruck/widgets/image_presntation_widget.dart';

class MealCard extends StatelessWidget {
  final int index;
  const MealCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: index.isOdd ? 50 : 20, bottom: index.isOdd ? 10 : 30),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        // gradient: boxLinearGradientLite,
        boxShadow: [
          BoxShadow(
              color: Colors.white12.withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(2, 1),
              spreadRadius: 3)
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedPositioned(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            left: 90,
            top: index.isOdd ? 0 : -10,
            right: -10,
            bottom: index.isOdd ? 20 : 20,
            child: Hero(
              tag: '${demoMeals[index]}',
              child: ImagePresntation(index: index),
            ),
          ),
          Positioned(
            bottom: 1,
            left: 0,
            right: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${demoMeals[index].toString().substring(13, demoMeals[index].toString().length - 7)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 2,
                      letterSpacing: 3,
                      fontSize: 40,
                      color: Colors.black54),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
