import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './controllers/cart_controller.dart';
import './controllers/home_controller.dart';
import './screens/home_screen.dart';

// create: (context) => HomeController(),
void main() {
  runApp(MultiProvider(
    providers: [
      // Provider<HomeController>(create: (context) => HomeController()),
      ChangeNotifierProvider(
        create: (_) => HomeController(),
      ),
      ChangeNotifierProvider(
        create: (_) => CartController(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Allison',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Food Truck',
            style: TextStyle(
                fontFamily: 'Allison', color: Colors.white, fontSize: 50),
          ),
          elevation: 5,
          // foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        backgroundColor: Colors.grey.shade500,
        body: SafeArea(child: HomeScreen()),
      ),
    );
  }
}
