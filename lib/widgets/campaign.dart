import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Campaign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.fill,
        dotSize: 5,
        indicatorBgPadding: 7,
        dotSpacing: 50,
        images: [
          // ExactAssetImage('images/banner.jpeg'),
          // ExactAssetImage('images/banner2.jpeg'),
          ExactAssetImage('images/banner-1.webp'),
          ExactAssetImage('images/banner-2.webp'),
        ],
      ),
    );
  }
}
