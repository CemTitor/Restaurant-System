import 'package:flutter/material.dart';
import 'package:restaurant_system/screens/home_screen.dart';
import 'package:restaurant_system/screens/login_screen.dart';
import 'package:restaurant_system/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant_system/screens/mainPage.dart';
import 'package:restaurant_system/screens/homePage.dart';

class HomePage extends StatelessWidget{
  static String tag= 'homePage';
  @override
  Widget build(BuildContext context) {
    final w=Padding(padding: EdgeInsets.all(8.0),

      child: Text(
        'Announcement',
        style: TextStyle(fontSize: 28.0,color: Colors.black),
      ),
    );
    final pic = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('image/unknown.jpg'), //Görsellerimizi henüz belirlemedik.

        ),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Colors.white,
          ])
      ),
      child: Column(
        children: <Widget>[pic,w],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}