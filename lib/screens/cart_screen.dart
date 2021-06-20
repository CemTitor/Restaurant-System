import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/models/food_modle.dart';
import 'package:restaurant_system/models/my_provider.dart';
import 'package:restaurant_system/models/status_service.dart';

final priceTextStyle = TextStyle(
  color: Colors.grey.shade600,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

class CartScreen extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  List<String> porders = [];
  StatusService _statusService = StatusService();
//   @override
//   _CartScreenState createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {

  Widget cartItem({
    @required String image,
    @required String name,
    @required int price,
    @required Function onTap,
    @required int quantity,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                        icon: Icon(Icons.clear),
                        onPressed: onTap,
                      ),
                      Text(
                        "$quantity",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      // IconButton(
                      //   iconSize: 18.0,
                      //   padding: const EdgeInsets.all(2.0),
                      //   icon: Icon(Icons.add),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          Text(
            "\TL${price * quantity}",
            style: priceTextStyle,
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    List<FoodModle> singleFoodList = [];
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;

    int total = provider.totalprice();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cart Screen"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      body: ListView.builder(
        reverse: true,
        itemCount: provider.cartList.length,
        itemBuilder: (ctx, index) {
          provider.getDeleteIndex(index);
          return cartItem(
            onTap: () {
              provider.delete();
            },
            image: provider.cartList[index].image,
            name: provider.cartList[index].name,
            price: provider.cartList[index].price,
            quantity: provider.cartList[index].quantity,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          List yourItemList = [];
          for (int i = 0; i < provider.cartList.length; i++)
            yourItemList.add({
              "image": provider.cartList[i].image,
              "name": provider.cartList[i].name,
              "price": provider.cartList[i].price,

            });
          _firestore
              .collection('pordersbyuser')
              .doc(_auth.currentUser.uid)
              .set({
            'list': yourItemList.toList(),



          });




          // _fireStore.collection('notifyseller').document().updateData({
          //   'Customer': userName,
          //   "address": controller.text,
          //   "mobile": mobileNumber,
          //   "Item": FieldValue.arrayUnion(yourItemList),
          // });

          porders.add('Yeni adres');
        },
        label: const Text('Place The Order'),
        icon: const Icon(Icons.add_circle_outline),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}

// class OrderListItem extends StatelessWidget {
//   // final OrderItem item;
//   // const OrderListItem({Key key, this.item}) : super(key: key);
//
//   String image;
//   int price;
//   String name;
//
//   OrderListItem(this.image, this.price, this.name);
//
//   // OrderListItem(String image, int price, String name);
//
//   @override
//   Widget build(BuildContext context) {
//     //firebasede foods collectionunu listeye ekledim. /ssu an tek bi veri cekiyoruz ffakaat yani listenin 1.elamanı (Foods daki pizza normalde pizza yı hamburgeri vs hepsini cekmemiz lazım onun ıcın de class yerine widget kullanacagız)
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Row(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             clipBehavior: Clip.antiAlias,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             child: image != null
//                 ? Image.network(
//                     image,
//                     fit: BoxFit.cover,
//                   )
//                 : null,
//           ),
//           const SizedBox(width: 20.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   name,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.grey,
//                       width: 1.0,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   height: 40.0,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         iconSize: 18.0,
//                         padding: const EdgeInsets.all(2.0),
//                         icon: Icon(Icons.remove),
//                         onPressed: () {},
//                       ),
//                       Text(
//                         "${2}",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       IconButton(
//                         iconSize: 18.0,
//                         padding: const EdgeInsets.all(2.0),
//                         icon: Icon(Icons.add),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(width: 10.0),
//           Text(
//             "\TL${price * 2}",
//             style: priceTextStyle,
//           ),
//         ],
//       ),
//     );
//   }
// }
