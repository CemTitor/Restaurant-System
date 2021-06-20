import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/components/rounded_button.dart';
import 'package:restaurant_system/models/dessert_modle.dart';
import '../models/my_provider.dart';

class DessertDetailScreen extends StatefulWidget {
  final String dessertImage;
  final int dessertPrice;
  final String dessertName;
  final String dessertDescription;
  static const String id = 'dessert_detailscreen';

  DessertDetailScreen({
    @required this.dessertImage,
    @required this.dessertPrice,
    @required this.dessertName,
    @required this.dessertDescription,
  });

  @override
  _DessertDetailScreenState createState() => _DessertDetailScreenState();
}

class _DessertDetailScreenState extends State<DessertDetailScreen> {
  int dessertQuantity = 1;

  @override
  Widget build(BuildContext context) {
    List<DessertModle> singleDessertList = [];
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getDrinkList();
   singleDessertList = provider.throwDessertModleList;

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
                        child: widget.dessertImage != null
                            ? Image.network(
                          widget.dessertImage,
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
                              '${widget.dessertName}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${widget.dessertDescription}',
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
                                if (dessertQuantity > 1) dessertQuantity--;
                              });
                            },
                          ),
                          Text(
                            '$dessertQuantity Piece',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                dessertQuantity++;
                              });
                            },
                          ),
                        ],
                      ),
                      Text(
                        '${widget.dessertPrice} TL',
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
                  image: widget.dessertImage,
                  name: widget.dessertName,
                  price: widget.dessertPrice,
                  quantity: dessertQuantity,
                );
              }, //Sepete ekleme işlemi
            ),
          ],
        ),
      ),
    );
  }
}
