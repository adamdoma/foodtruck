import 'package:flutter/material.dart';
import 'package:foodtruck/controllers/home_controller.dart';
import 'package:foodtruck/models/main_display.dart';
import 'package:provider/provider.dart';
import '../models/userInfo.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            top: Provider.of<HomeController>(context, listen: true).homeState ==
                    HomeState.info
                ? size.height -
                    Provider.of<HomeController>(context, listen: true)
                        .getUserInfoBar()
                : Provider.of<HomeController>(context, listen: true)
                        .getUserInfoBar() +
                    5,
            left: 5,
            right: 5,
            bottom: 0,
            child: MainDisplay(),
          ),
        ],
      );
    });
  }
}
