import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/widgets/food_widget.dart';

class RestoDetailScreen extends StatefulWidget {
  static const String id = 'resto_detailScreen';
  @override
  _RestoDetailState createState() => _RestoDetailState();
}

class _RestoDetailState extends State<RestoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: Color(0xFFD71219),
        title: Row(
          children: [
            Text("Restaurant Details"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.red[500],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              padding: EdgeInsets.all(20),
              // color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/popcorn.png'), //TODO restaurant fotosu
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Restaurant ismi ve adresi '),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        height: 25,
                        width: 40,
                        child: Center(
                          child: Text(
                            '6.7', //TODO restaurant puanı
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Menus and Foods',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Food('pizza', 2, 'food description'),
            Food('pizza', 2, 'food description'),
            Food('pizza', 2, 'food description'),
            Food('pizza', 2, 'food description'),
            Food('pizza', 2, 'food description'),
            Food('pizza', 2, 'food description'),
            // RestaurantWidget(),
          ],
        ),
      ),
    );
  }
}
