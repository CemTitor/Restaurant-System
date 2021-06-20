import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/screens/menu.dart';
import 'package:restaurant_system/widgets/campaign.dart';
import 'package:restaurant_system/widgets/favorites_title.dart';
import 'package:restaurant_system/widgets/previous_orders.dart';
import 'package:restaurant_system/widgets/previous_orders_title.dart';
import 'package:restaurant_system/widgets/account_info.dart';
import 'package:restaurant_system/widgets/address.dart';
import 'package:restaurant_system/widgets/favori_list.dart';

class HomeScreen extends StatefulWidget {

  static const String id = 'homeScreen';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFD71219),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('images/logo2.png'),
            Text("Restaurant System"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AccountInfo(),
            Campaign(),
            // BookNow(), //add another page
            Address(),
            PreviousOrdersTitle(),
      //      PreviousOrders(),
            FavoritesTitle(),
            AdviceList(),
          ],
        ),
      ),
    );
  }
}
