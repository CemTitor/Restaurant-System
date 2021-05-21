import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget {
  final String restaurantName;
  final String restaurantAdress;
  final int restaurantPoint;
  final String restaurantImage;
  final Function onTap;

  Restaurant(this.restaurantName, this.restaurantAdress, this.restaurantPoint,
      this.restaurantImage, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
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
                onPressed: onTap,
                child: Text(
                  restaurantName + ", " + restaurantAdress,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 30,
                height: 30,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: restaurantImage != null
                    ? Image.network(
                        restaurantImage,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
