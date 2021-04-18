import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/screens/first_screen.dart';
import 'package:restaurant_system/screens/login_screen.dart';
import 'package:restaurant_system/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant_system/screens/main_screen.dart';
import 'package:restaurant_system/screens/home_screen.dart';
import 'package:restaurant_system/components/reusable_card.dart';
import 'package:restaurant_system/constants.dart';
import 'book_screen.dart';
import 'package:restaurant_system/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:restaurant_system/components/rounded_button.dart';
import 'package:restaurant_system/screens/main_screen.dart';
import 'package:restaurant_system/screens/home_screen.dart';
import 'package:restaurant_system/components/campaign.dart';

class HomePage extends StatelessWidget {
  static String tag = 'homePage';
  @override
  Widget build(BuildContext context) {
    final bookNow = Expanded(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, BookScreen.id);
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.calendar_today,
              size: 180,
              color: Color(0xFFD71219),
            ),
            Text(
              "Book Now!",
              style: kSendButtonTextStyle,
            )
          ],
        ),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.white,
        Colors.white,
      ])),
      child: Column(
        children: <Widget>[
          Campaign(),
          bookNow,
          Container(
            height: 40,
            color: Colors.white,
          )
        ],
      ),
    );

    return Scaffold(
      // backgroundColor: Color(0xFFD71219),
      backgroundColor: Colors.grey,
      body: body,
    );
  }
}
