import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/components/rounded_button.dart';
import '../models/drink_modle.dart';
import '../models/my_provider.dart';

class DrinkDetailScreen extends StatefulWidget {
  final String drinkImage;
  final int drinkPrice;
  final String drinkName;
  final String drinkDescription;
  static const String id = 'drink_detailscreen';

  DrinkDetailScreen({
    @required this.drinkImage,
    @required this.drinkPrice,
    @required this.drinkName,
    @required this.drinkDescription,
  });

  @override
  _DrinkDetailScreenState createState() => _DrinkDetailScreenState();
}

class _DrinkDetailScreenState extends State<DrinkDetailScreen> {
  int drinkQuantity = 1;

  @override
  Widget build(BuildContext context) {
    List<DrinkModle> singleDrinkList = [];
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getDrinkList();
    singleDrinkList = provider.throwDrinkModleList;

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
            Text("Drink Details"),
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
                        child: widget.drinkImage != null
                            ? Image.network(
                          widget.drinkImage,
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
                              '${widget.drinkName}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${widget.drinkDescription}',
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
                                if (drinkQuantity > 1) drinkQuantity--;
                              });
                            },
                          ),
                          Text(
                            '$drinkQuantity Piece',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                drinkQuantity++;
                              });
                            },
                          ),
                        ],
                      ),
                      Text(
                        '${widget.drinkPrice} TL',
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
                  image: widget.drinkImage,
                  name: widget.drinkName,
                  price: widget.drinkPrice,
                  quantity: drinkQuantity,
                );
              }, //Sepete ekleme işlemi
            ),
          ],
        ),
      ),
    );
  }
}
