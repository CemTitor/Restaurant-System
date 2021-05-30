import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/my_provider.dart';
import '../models/resto_list.dart';
import '../screens/resto_detail_screen.dart';
import 'restaurant_widget.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({
    Key key,
    @required this.singleRestoList,
  }) : super(key: key);

  final List<RestoList> singleRestoList;

  @override
  Widget build(BuildContext context) {
    List<RestoList> singleRestoList = [];
    MyProvider provider1 = Provider.of<MyProvider>(context);
    provider1.getRList();
    singleRestoList = provider1.throwrestlist;

    return ListView(
      padding: EdgeInsets.all(0),
      primary: false,
      shrinkWrap: true,
      children: singleRestoList
          .map(
            (e) => Restaurant(e.name, e.adres, e.point, e.restaurantImage, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestoDetailScreen(
                    restaurantName: e.name,
                    restaurantAdress: e.adres,
                    restaurantPoint: e.point,
                    restaurantImage: e.restaurantImage,
                  ),
                ),
              );
            }),
          )
          .toList(),
    );
  }
}
