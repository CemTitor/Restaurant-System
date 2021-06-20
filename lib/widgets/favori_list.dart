import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/models/food_modle.dart';
import 'package:restaurant_system/screens/food_detail.dart';
import 'package:restaurant_system/widgets/food_widget.dart';

import '../models/my_provider.dart';
import '../models/resto_list.dart';
import '../screens/resto_detail_screen.dart';
import 'restaurant_widget.dart';

class AdviceList extends StatelessWidget {
  const AdviceList({
    Key key,
    @required this.favorifoods,
  }) : super(key: key);

  final List<FoodModle> favorifoods;

  @override
  Widget build(BuildContext context) {
    List<FoodModle> favoriList = [];
    MyProvider provider1 = Provider.of<MyProvider>(context);
    provider1.getFavoriList();
    favoriList = provider1.throwfavoriList;


    return ListView(
      primary: false,
      shrinkWrap: true,
      children: favoriList
          .map(
            (e) => FoodWidget(
            foodImage: e.image,
            foodPrice: e.price,
            foodName: e.name,
            //  foodDescription: e.description,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailScreen(
                    foodImage: e.image,
                    foodPrice: e.price,
                    foodName: e.name,
                    //    foodDescription: e.description,
                  ),
                ),
              );
            }),
      )
          .toList(),
    );
  }
}
