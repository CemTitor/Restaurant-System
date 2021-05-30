import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/components/rounded_button.dart';
import '../models/food_modle.dart';
import '../models/my_provider.dart';

class FoodDetailScreen extends StatefulWidget {
  final String foodImage;
  final int foodPrice;
  final String foodName;
  final String foodDescription;
  static const String id = 'food_detailScreen';

  FoodDetailScreen({
    @required this.foodImage,
    @required this.foodPrice,
    @required this.foodName,
    @required this.foodDescription,
  });

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int foodQuantity = 1;

  @override
  Widget build(BuildContext context) {
    List<FoodModle> singleFoodList = [];
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        backgroundColor: Color(0xFFD71219),
        title: Row(
          children: [
            Text("Food Details"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: widget.foodImage != null
                            ? Image.network(
                                widget.foodImage,
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              '${widget.foodName}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${widget.foodDescription}',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (foodQuantity > 1) foodQuantity--;
                              });
                            },
                          ),
                          Text(
                            '$foodQuantity Piece',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                foodQuantity++;
                              });
                            },
                          ),
                        ],
                      ),
                      Text(
                        '${widget.foodPrice} TL',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            RoundedButton(
              title: 'Sepete Ekle',
              colour: Colors.green,
              onPressed: () {
                provider.addToCart(
                  image: widget.foodImage,
                  name: widget.foodName,
                  price: widget.foodPrice,
                  quantity: foodQuantity,
                );
              }, //Sepete ekleme işlemi
            ),
          ],
        ),
      ),
    );
  }
}
