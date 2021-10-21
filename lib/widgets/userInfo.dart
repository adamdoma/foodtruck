import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';
import '../controllers/home_controller.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo>
    with SingleTickerProviderStateMixin {
  HomeController homeController = HomeController();
  late AnimationController _animationController;
  bool pressed = false;

  void HandlePress() {
    setState(() {
      pressed = !pressed;
      if (pressed == true) {
        _animationController.forward();
        Provider.of<HomeController>(context, listen: false)
            .changeHomeState(HomeState.info);
      } else {
        _animationController.reverse();
        Provider.of<HomeController>(context, listen: false)
            .changeHomeState(HomeState.normal);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: size.width,
        height: Provider.of<HomeController>(context).homeState == HomeState.info
            ? size.height - 100
            : Provider.of<HomeController>(context).getUserInfoBar(),
        decoration: BoxDecoration(
          gradient: boxLinearGradient,
          borderRadius: BorderRadius.circular(20),
        ),
        child:
            Provider.of<HomeController>(context).homeState == HomeState.normal
                ? infoBarClosed()
                : infoBarOpen());
  }

  ListTile infoBarClosed() {
    return ListTile(
      title: Text(
        'Adam',
        style: TextStyle(
            fontSize: 50, color: textColor, fontWeight: FontWeight.w700),
      ),
      dense: false,
      leading: Icon(
        Icons.account_circle_outlined,
        color: textColor,
        size: 50,
      ),
      trailing: IconButton(
        iconSize: 50,
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_home,
          progress: _animationController,
          color: textColor,
        ),
        onPressed: HandlePress,
      ),
    );
  }

  AnimatedContainer infoBarOpen() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            infoBarClosed(),
            Text(
              'User name here',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
