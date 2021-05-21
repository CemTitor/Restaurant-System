import 'package:flutter/cupertino.dart';

class RestoList {
  final String adres;
  final String name;
  final int point;
  final String restaurantImage;
  final Function onTap;

  RestoList(
      {@required this.adres,
      @required this.name,
      @required this.point,
      @required this.restaurantImage,
      @required this.onTap});
}
