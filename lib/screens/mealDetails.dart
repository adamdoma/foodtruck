import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:foodtruck/classes/meal.dart';
import 'package:foodtruck/controllers/cart_controller.dart';
import 'package:foodtruck/controllers/meal_controller.dart';
import 'package:foodtruck/test/widget_test.dart';
import 'package:provider/provider.dart';

import '../classes/cart.dart';

class MealDetails extends StatefulWidget {
  late final int mealIndex;
  MealDetails({required this.mealIndex});

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  int tabIndex = 1;
  String _cartTag = "";
  late Meal meal;

  void selectTab(int selected) {
    tabIndex = selected;
    setState(() {});
  }

  Meal getMeal() {
    MealController _mealController =
        MealController(type: demoMeals[widget.mealIndex]);
    _mealController.retrunType();
    return _mealController.retrunType();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    meal = getMeal();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Hero(
                  tag: _cartTag == "" ? demoMeals[widget.mealIndex] : _cartTag,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(demoMeals[widget.mealIndex]),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: width,
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: meal.selectionList().length,
                  itemBuilder: (context, index) {
                    const margin = 15;
                    return GestureDetector(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin:
                            EdgeInsets.symmetric(horizontal: margin.toDouble()),
                        width:
                            (width / meal.selectionList().length) - margin * 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: tabIndex == index + 1 ? Colors.grey : null),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              '${meal.selectionList()[index].toString()}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: tabIndex == index + 1
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ),
                      onTap: () => selectTab(index + 1),
                    );
                  },
                ),
              ),
              ElevatedButton(
                child: Text('Add To Cart'),
                onPressed: () {
                  Provider.of<CartController>(context, listen: false).addMeal(
                    new Cart(
                        meal: getMeal(), mealImg: demoMeals[widget.mealIndex]),
                  );
                  Meal meal =
                      Provider.of<CartController>(context, listen: false)
                          .getList()
                          .last
                          .meal;
                  setState(() {
                    _cartTag = '${meal.id}';
                  });

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// GestureDetector(
//   child: AnimatedContainer(
//     duration: Duration(milliseconds: 300),
//     width: tabIndex == 1 ? width / 2 : width / 4,
//     decoration: BoxDecoration(
//         color: Colors.grey),
//     child: Icon(
//       Icons.info,
//       color: tabIndex == 1 ? Colors.red : Colors.white,
//     ),
//   ),
//   onTap: () => selectTab(index),
// ),
// GestureDetector(
//   child: AnimatedContainer(
//     duration: Duration(milliseconds: 300),
//     width: tabIndex == 2 ? width / 2 : width / 4,
//     decoration: BoxDecoration(
//       color: Colors.grey,
//       border: Border.all(width: 2, color: Colors.white),
//     ),
//     child: Icon(Icons.ac_unit,
//         color: tabIndex == 2 ? Colors.red : Colors.white),
//   ),
//   onTap: () => selectTab(2),
// ),
// GestureDetector(
//   child: AnimatedContainer(
//     duration: Duration(milliseconds: 300),
//     width: tabIndex == 3 ? width / 2 : width / 4,
//     decoration: BoxDecoration(
//         border: Border.all(width: 2, color: Colors.white),
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(30),
//           bottomRight: Radius.circular(30),
//         ),
//         color: Colors.grey),
//     child: Icon(Icons.access_time,
//         color: tabIndex == 3 ? Colors.red : Colors.white),
//   ),
//   onTap: () => selectTab(3),
// )
