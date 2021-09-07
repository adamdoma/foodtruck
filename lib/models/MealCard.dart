import 'package:flutter/material.dart';
import '../test/widget_test.dart';
import '../consts.dart';

class MealCard extends StatefulWidget {
  final int index;
  const MealCard({Key? key, required this.index}) : super(key: key);

  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard>
    with SingleTickerProviderStateMixin {
  double animateMove = 100;
  late AnimationController animationController;
  Animation? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600),
        upperBound: 0,
        lowerBound: -50);

    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.index.isOdd ? 50 : 20),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        gradient: boxLinearGradient,
        boxShadow: [
          BoxShadow(
              color: Colors.white12.withOpacity(0.1),
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
            left: 3,
            top: -20,
            right: 5,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  height: 80,
                  width: 100,
                  child: demoMeals[widget.index],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Price:${widget.index + 20}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Icon(Icons.add_shopping_cart_outlined)
              ],
            ),
          )
        ],
      ),
    );
  }
}
