import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodWidget extends StatelessWidget {
  final String foodImage;
  final int foodPrice;
  final String foodName;
  //final String foodDescription;
  final Function onTap;

  FoodWidget(
      {@required this.foodImage,
      @required this.foodPrice,
      @required this.foodName,
  //    @required this.foodDescription,
     @required this.onTap
  }); // String foodDescription;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: onTap,
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
                    // Text(foodDescription),
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
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '$foodPrice TL',
                          style: TextStyle(color: Colors.orange),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 100,
                  height: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: foodImage != null
                      ? Image.network(
                          foodImage,
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
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
