import 'package:flutter/cupertino.dart';

class DessertModle {
  final String image;
  final String name;
  final int price;
  //final String description;
  final Function onTap;
  DessertModle(
      {@required this.image,
        @required this.name,
        @required this.price,
        //@required this.description,
        @required this.onTap
      }
        );
}
