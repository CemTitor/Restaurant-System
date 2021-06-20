import 'package:flutter/material.dart';
import 'package:restaurant_system/screens/resto_detail_screen.dart';
import 'package:restaurant_system/widgets/restaurant_widget.dart';

class PreviousOrdersScreen extends StatelessWidget {
  static const String id = 'profileScreen';

  final List<String> previousOrders = <String>['A', 'B', 'C'];
  int foodNumberInOrder = 1;
  final List<int> orderPrices = <int>[12, 23, 43];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: new AppBar(
        title: Text("Previous Orders"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: previousOrders.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                height: 25,
                width: 40,
                child: Center(
                  child: Text(
                    'puan',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Sipariş yeri'),
                    subtitle: Text('alınma tarihi'),
                    onTap: () {
                      //   Navigator.push(
                        //context,
                        // MaterialPageRoute(
                        // builder: (context) => RestoDetailScreen(
                        //       // restaurantName: e.name,
                        //       // restaurantAdress: e.adres,
                        //       // restaurantPoint: e.point,
                        //       // restaurantImage: e.restaurantImage,
                        //       ),
                        // ),
                      //);
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: foodNumberInOrder,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          'siparişin içindeki tek bir food',
                        ),
                        trailing: Text(
                          '1 adet',
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Text(
                      'Total Price',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '${orderPrices[index]} TL',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_right_rounded),
              isThreeLine: true,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 5,
        ),
      ),
    );
  }
} //
