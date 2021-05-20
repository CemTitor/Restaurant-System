import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/models/my_provider.dart';
import 'package:restaurant_system/models/resto_list.dart';
import 'package:restaurant_system/screens/resto_detail_screen.dart';

class Restaurant extends StatelessWidget {
  String restaurantName;
  String restaurantAdress;
  int restaurantPoint;

  Restaurant(this.restaurantName, this.restaurantAdress, this.restaurantPoint);

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                height: 25,
                width: 40,
                child: Center(
                  child: Text(
                    restaurantPoint.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, RestoDetailScreen.id);
                },
                child: Text(
                  restaurantName + ", " + restaurantAdress,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
