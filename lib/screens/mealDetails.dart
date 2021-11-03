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
  int tabIndex2 = 1;
  double selectingContainer = 40;
  String _cartTag = "";
  late dynamic meal;
  dynamic mealTest;

  void selectTab(int selected) {
    tabIndex = selected;
    setState(() {});
  }

  void secondTabSelection(int selected) {
    tabIndex2 = selected;
    setState(() {});
  }

  Meal getMeal() {
    MealController _mealController = MealController();
    return _mealController.returnType(demoMeals[widget.mealIndex]);
  }

  @override
  void initState() {
    super.initState();
    meal = getMeal();
    Provider.of<MealController>(context, listen: false).meal = meal;
    if (meal.runtimeType.toString() == 'Toast') {
      setState(() {
        selectingContainer = 90;
      });
    }
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
                height: selectingContainer,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: meal.selectionList().length,
                  itemBuilder: (context, index) {
                    const margin = 15;
                    if (meal.runtimeType.toString() != 'Toast') {
                      return firstSelection(margin, width, index);
                    } else {
                      return Column(
                        children: [
                          firstSelection(margin, width, index),
                          SizedBox(
                            height: 15,
                          ),
                          secondSelection(margin, width, index),
                        ],
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: meal.addons.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: Text(
                          '${Provider.of<MealController>(context, listen: false).meal.addons[index].addonName}',
                          style: TextStyle(color: Colors.red, fontSize: 30),
                        ),
                        leading: Checkbox(
                          onChanged: (val) {
                            Provider.of<MealController>(context, listen: false)
                                .handleAddonSelection(
                                    Provider.of<MealController>(context,
                                            listen: false)
                                        .meal,
                                    index);
                          },
                          value:
                              Provider.of<MealController>(context, listen: true)
                                  .meal
                                  .addons[index]
                                  .addonSelected,
                        ),
                      );
                    },
                  ),
                ),
              ),
              ElevatedButton(
                child: Icon(
                  Icons.add_shopping_cart_rounded,
                  size: 40,
                ),
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

  GestureDetector secondSelection(int margin, double width, int index) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: margin.toDouble()),
        width: (width / meal.subSelection().length) - margin * 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            color: tabIndex2 == index + 1 ? Colors.grey : null),
        child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              '${meal.subSelection()[index].toString()}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: tabIndex2 == index + 1 ? Colors.black : Colors.white),
            ),
          ),
        ),
      ),
      onTap: () => secondTabSelection(index + 1),
    );
  }

  GestureDetector firstSelection(int margin, double width, int index) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: margin.toDouble()),
        width: (width / meal.selectionList().length) - margin * 2,
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
                  color: tabIndex == index + 1 ? Colors.black : Colors.white),
            ),
          ),
        ),
      ),
      onTap: () => selectTab(index + 1),
    );
  }
}
