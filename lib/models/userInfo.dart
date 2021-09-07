import 'package:flutter/material.dart';
import '../consts.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool pressed = false;

  void HandlePress() {
    setState(() {
      pressed = !pressed;
      pressed ? _animationController.forward() : _animationController.reverse();
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
    return Container(
      width: size.width,
      height: 85,
      decoration: BoxDecoration(
        gradient: boxLinearGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: ListTile(
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
          subtitle: Text('blabla'),
        ),
      ),
    );
  }
}
