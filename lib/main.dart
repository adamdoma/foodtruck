import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
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
        backgroundColor: Colors.black,
        body: SafeArea(child: HomeScreen()),
      ),
    );
  }
}
