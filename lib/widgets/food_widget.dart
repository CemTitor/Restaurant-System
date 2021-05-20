import 'package:flutter/material.dart';
import 'package:restaurant_system/screens/food_detail.dart';

class Food extends StatelessWidget {
  String foodName;
  int foodPrice;
  String foodDescription;

  Food(this.foodName, this.foodPrice, this.foodDescription);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        Navigator.pushNamed(context, FoodDetailScreen.id);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, //TODO neden calısmıyo ?
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(foodDescription),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          height: 25,
                          width: 40,
                          child: Icon(Icons.add),
                        ),
                        Text(
                          '   ücret',
                          style: TextStyle(color: Colors.orange),
                        )
                      ],
                    ),
                  ],
                ),
                Image.asset('images/popcorn.png'),
              ],
            ),
            Divider(
              thickness: 1,
              height: 2,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
/*
Widget Food({@required item }
)


 */