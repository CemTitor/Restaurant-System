import 'package:flutter/cupertino.dart';

class DrinkModle {
  final String image;
  final String name;
  final int price;
 // final String description;
  final Function onTap;
  DrinkModle(
      {@required this.image,
        @required this.name,
        @required this.price,
      //  @required this.description,
        @required this.onTap
      });
}
