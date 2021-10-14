import 'package:flutter/material.dart';
import 'package:foodtruck/classes/cart.dart';
import 'package:foodtruck/classes/meal.dart';
import 'package:foodtruck/consts.dart';
import 'package:foodtruck/controllers/home_controller.dart';
import 'package:foodtruck/test/widget_test.dart';
import 'package:provider/provider.dart';

class CartInfo extends StatefulWidget {
  int mealIndex;
  CartInfo({required this.mealIndex});

  @override
  _CartInfoState createState() => _CartInfoState();
}

class _CartInfoState extends State<CartInfo> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    List<Meal> list = Provider.of<Cart>(context, listen: true).getList();
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (pressed) {
            Provider.of<HomeController>(context, listen: false)
                .changeHomeState(HomeState.cart);
          } else {
            Provider.of<HomeController>(context, listen: false)
                .changeHomeState(HomeState.normal);
          }
          pressed = !pressed;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: size.width,
        height: Provider.of<HomeController>(context).homeState == HomeState.cart
            ? size.height - 100
            : 50,
        child: Container(
          decoration: BoxDecoration(
            gradient: boxLinearGradient,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Provider.of<HomeController>(context).homeState ==
                  HomeState.cart
              ? cartBarOpen()
              : Row(
                  children: [
                    Text(
                      'cart:',
                      style: TextStyle(
                          fontSize: 50,
                          color: textColor,
                          fontWeight: FontWeight.w700),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.red,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              Meal meal = list.last;
                              print(meal.id);
                              print(list.length);
                              return Hero(
                                tag: '${list[index].id}',
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 20,
                                          offset: Offset(5, 5))
                                    ],
                                    border: Border.all(
                                        color: Colors.transparent, width: 2),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          demoMeals[widget.mealIndex]),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  //TODO: make function for the closed cart with List view that contains the meals

  AnimatedContainer cartBarOpen() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      color: Colors.white.withOpacity(0.8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: ListView.builder(
                  itemCount: Provider.of<Cart>(context).getList().length,
                  itemBuilder: (context, index) {
                    return Text('$index');
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  print('cartInfo file place order');
                },
                child: Text('ORDER'))
          ],
        ),
      ),
    );
  }
}
