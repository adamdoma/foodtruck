import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodtruck/classes/cart.dart';
import '../controllers/cart_controller.dart';
import 'package:foodtruck/classes/meal.dart';
import 'package:foodtruck/consts.dart';
import 'package:foodtruck/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class CartInfo extends StatefulWidget {
  final int? mealIndex;
  CartInfo({required this.mealIndex});

  @override
  _CartInfoState createState() => _CartInfoState();
}

class _CartInfoState extends State<CartInfo> {
  bool pressed = false;
  int selected = -1;
  double h = 40, w = 40;
  ScrollController sc = ScrollController();
  @override
  Widget build(BuildContext context) {
    List<Cart> list =
        Provider.of<CartController>(context, listen: true).getList();
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
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
          child: Container(
            height: 40,
            width: 80,
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: FittedBox(
              fit: BoxFit.none,
              child: Icon(
                Provider.of<HomeController>(context).homeState == HomeState.cart
                    ? Icons.arrow_drop_down
                    : Icons.arrow_drop_up,
                color: Colors.black54,
                size: 30,
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: size.width,
          height:
              Provider.of<HomeController>(context).homeState == HomeState.cart
                  ? size.height - 140
                  : 60,
          child: Container(
            decoration: BoxDecoration(
              gradient: boxLinearGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child:
                Provider.of<HomeController>(context, listen: true).homeState ==
                        HomeState.cart
                    ? cartBarOpen(list)
                    : cartTabClosed(list),
          ),
        ),
      ],
    );
  }

  Row cartTabClosed(List<Cart> list) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Center(
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 2,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Center(
                      child: Text(
                        '${Provider.of<CartController>(context, listen: true).getList().length}',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'David'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            color: Colors.black,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return closedCartMeal(
                    h: selected == index ? 0 : h,
                    w: selected == index ? 0 : w,
                    widget: widget,
                    meal: list[index].meal,
                    imgString: list[index].mealImg,
                  );
                }),
          ),
        )
      ],
    );
  }

  //TODO: make function for the closed cart with List view that contains the meals

  Container cartBarOpen(List<Cart> list) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: double.infinity,
      width: double.infinity,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(list[index].mealImg), fit: BoxFit.cover),
              ),
            ),
            subtitle: Text(
              '${list[index].mealImg.substring(13, list[index].mealImg.length - 7)}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontWeight: FontWeight.w900),
            ),
            trailing: CircleAvatar(
              child: Text('${list[index].meal.price}'),
            ),
          );
        },
      ),
    );
  }
}

class closedCartMeal extends StatelessWidget {
  const closedCartMeal(
      {Key? key,
      required this.meal,
      required this.h,
      required this.w,
      required this.widget,
      required this.imgString})
      : super(key: key);

  final double h;
  final double w;
  final CartInfo widget;
  final Meal meal;
  final String imgString;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${meal.getTagName()}',
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: h,
        width: w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.white, blurRadius: 15, offset: Offset(2, 3))
          ],
          border: Border.all(color: Colors.transparent, width: 2),
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(imgString),
          ),
        ),
      ),
    );
  }
}
