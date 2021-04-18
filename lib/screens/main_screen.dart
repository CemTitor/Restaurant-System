import 'package:flutter/material.dart';
import 'package:restaurant_system/screens/first_screen.dart';
import 'package:restaurant_system/screens/login_screen.dart';
import 'package:restaurant_system/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant_system/screens/main_screen.dart';
import 'package:restaurant_system/screens/home_screen.dart';

class MainPage extends StatefulWidget {
  static const String id = 'mainPage';
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainPage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD71219),
        title: Text("Restaurant App"),
      ),
      // backgroundColor: Color(0xFFD71219),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFD71219),
        currentIndex: _currentIndex,
        // backgroundColor: Color(0xFFD71219),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank), title: Text("Orders")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text("Cart")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Account")),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_help), title: Text("Help")),
          //ask a question icon will add
        ],
      ),
      body: getBodyWidget(),
    );
    ;
  }

  getBodyWidget() {
    return (_currentIndex == 0) ? HomePage() : Container();
  }
}
