import 'package:flutter/material.dart';
import 'package:restaurant_system/screens/home_screen.dart';
import 'package:restaurant_system/screens/login_screen.dart';
import 'package:restaurant_system/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant_system/screens/mainPage.dart';
import 'package:restaurant_system/screens/homePage.dart';

class MainPage extends StatefulWidget{

   static const String id = 'mainPage';
    @override
    _MainState createState() => _MainState();

}
class _MainState extends State<MainPage>{
  var _currentIndex =0;
  @override

  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant App"),
      ),




      backgroundColor: Color(0xFFF0F0F0),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
        items: [

          BottomNavigationBarItem(icon: Icon(Icons.home),title:Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank),title:Text("Orders")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),title:Text("Cart")),
          BottomNavigationBarItem(icon: Icon(Icons.person),title:Text("Account")),
          //ask a question icon will add
        ],),
      body: getBodyWidget(),

    );
    ;
  }
  getBodyWidget(){
    return  (_currentIndex==0)? HomePage(): Container();
  }

}