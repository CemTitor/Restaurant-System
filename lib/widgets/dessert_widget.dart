import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DessertWidget extends StatelessWidget {
  final String dessertImage;
  final int dessertPrice;
  final String dessertName;
  //final String foodDescription;
  final Function onTap;

  DessertWidget(
      {@required this.dessertImage,
        @required this.dessertPrice,
        @required this.dessertName,
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
                      dessertName,
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
                          '$dessertPrice TL',
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
                  child: dessertImage != null
                      ? Image.network(
                    dessertImage,
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
