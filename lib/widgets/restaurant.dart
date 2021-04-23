import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget {
  String restaurantName;
  String restaurantAdress;
  double restaurantPoint;

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
              Text(
                restaurantName + ", " + restaurantAdress,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
