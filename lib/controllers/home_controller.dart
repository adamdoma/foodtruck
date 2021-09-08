import 'package:flutter/material.dart';

enum HomeState { normal, cart, info }

class HomeController extends ChangeNotifier {
  double _userInfoBar = 80;
  double _cartBar = 40;
  HomeState homeState = HomeState.normal;

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  double getUserInfoBar() {
    return _userInfoBar;
  }

  double getCartBar() {
    return _cartBar;
  }

  void setUserInfoBar(double height) {
    this._userInfoBar = height;
    notifyListeners();
  }

  void setCArtBar(double height) {
    this._cartBar = height;
    notifyListeners();
  }
}
