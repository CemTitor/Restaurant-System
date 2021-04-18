import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/screens/home_screen.dart';

class Campaign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.fitWidth,
        dotSize: 5,
        indicatorBgPadding: 7,
        dotSpacing: 50,
        images: [
          ExactAssetImage('images/banner.jpeg'),
          ExactAssetImage('images/banner2.jpeg'),
        ],
      ),
    );
  }
}
