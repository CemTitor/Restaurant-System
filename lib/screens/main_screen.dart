

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/models/food_modle.dart';
import 'package:restaurant_system/models/my_provider.dart';
import 'package:restaurant_system/screens/other_screen.dart';
import 'package:restaurant_system/screens/help_screen.dart';
import 'package:restaurant_system/screens/home_screen.dart';
import 'package:restaurant_system/screens/search_screen.dart';
import 'package:restaurant_system/screens/cart_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'mainScreen';

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainScreen> {



  @override
  Widget build(BuildContext context) {
    List<FoodModle> singleFoodList = [];
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  var _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    OtherScreen(),
    HelpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFD71219),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Other',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_help),
            label: 'Help',
          ),
          //ask a question icon will add
        ],
      ),
    );
  }
}
