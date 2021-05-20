import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/models/food_modle.dart';
import 'package:restaurant_system/models/my_provider.dart';

final priceTextStyle = TextStyle(
  color: Colors.grey.shade600,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List<FoodModle> singleFoodList = [];
    MyProvider provider = Provider.of<MyProvider>(context);
     provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;




    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: 80,
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
            ),
          ),


          ListView(
            padding: const EdgeInsets.fromLTRB(
              16.0,
              kToolbarHeight + 40.0,
              16.0,
              16.0,

            ),

            children: singleFoodList
                .map(
                  (e) => OrderListItem(e.image, e.price, e.name),
            )
                .toList(),
          ),


        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      height: 2.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
// class OrderItem {
//
//   final String title;
//   final int qty;
//   final double price;
//   final String image;
//   final Color bgColor;
//   OrderItem({this.title, this.qty, this.price, this.image, this.bgColor});
// }

class OrderListItem extends StatelessWidget {
  // final OrderItem item;
  // const OrderListItem({Key key, this.item}) : super(key: key);

  String image;
  int price;
  String name;

  OrderListItem(this.image, this.price, this.name);

  // OrderListItem(String image, int price, String name);

  @override
  Widget build(BuildContext context) {
    //firebasede foods collectionunu listeye ekledim. /ssu an tek bi veri cekiyoruz ffakaat yani listenin 1.elamanı (Foods daki pizza normalde pizza yı hamburgeri vs hepsini cekmemiz lazım onun ıcın de class yerine widget kullanacagız)

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: image != null
                ? Image.network(
              image,
              fit: BoxFit.cover,
            )
                : null,
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 40.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        iconSize: 18.0,
                        padding: const EdgeInsets.all(2.0),
                        icon: Icon(Icons.remove),
                        onPressed: () {},
                      ),
                      Text(
                        "${2}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      IconButton(
                        iconSize: 18.0,
                        padding: const EdgeInsets.all(2.0),
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          Text(
            "\TL${price * 2}",
            style: priceTextStyle,
          ),
        ],
      ),
    );
  }
}