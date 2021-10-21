import 'package:flutter/material.dart';
import 'package:foodtruck/classes/meal.dart';
import 'package:foodtruck/controllers/cart_controller.dart';
import 'package:foodtruck/test/widget_test.dart';
import 'package:provider/provider.dart';
import '../classes/burger.dart';

import '../classes/cart.dart';

class MealDetails extends StatefulWidget {
  late final int meal;
  MealDetails({required this.meal});

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  int tabIndex = 1;
  String _cartTag = "";
  void selectTab(int selected) {
    tabIndex = selected;
    setState(() {});
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
                  tag: _cartTag == "" ? demoMeals[widget.meal] : _cartTag,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(demoMeals[widget.meal]),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: tabIndex == 1 ? width / 2 : width / 4,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                            color: Colors.grey),
                        child: Icon(
                          Icons.info,
                          color: tabIndex == 1 ? Colors.red : Colors.white,
                        ),
                      ),
                      onTap: () => selectTab(1),
                    ),
                    GestureDetector(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: tabIndex == 2 ? width / 2 : width / 4,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(width: 2, color: Colors.white),
                        ),
                        child: Icon(Icons.ac_unit,
                            color: tabIndex == 2 ? Colors.red : Colors.white),
                      ),
                      onTap: () => selectTab(2),
                    ),
                    GestureDetector(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: tabIndex == 3 ? width / 2 : width / 4,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: Colors.grey),
                        child: Icon(Icons.access_time,
                            color: tabIndex == 3 ? Colors.red : Colors.white),
                      ),
                      onTap: () => selectTab(3),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Add To Cart'),
                onPressed: () {
                  Provider.of<CartController>(context, listen: false).addMeal(
                    new Cart(meal: new Meal(), mealImg: demoMeals[widget.meal]),
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
