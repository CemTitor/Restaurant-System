//
// import 'package:flutter/cupertino.dart';
//
// import 'package:flutter/material.dart';
// import 'package:restaurant_system/screens/home_screen.dart';
// import 'package:restaurant_system/widgets/food_widget.dart';
// import 'package:provider/provider.dart';
// import 'package:restaurant_system/models/food_modle.dart';
// import 'package:restaurant_system/models/my_provider.dart';
// import '../widgets/food_widget.dart';
// import 'food_detail.dart';
// import 'main_screen.dart';
//
// class RestoDetailScreen extends StatelessWidget {
//   static const String id = 'resto_detailScreen';
//
//   final String restaurantName;
//   final String restaurantAdress;
//   final int restaurantPoint;
//   final String restaurantImage;
//   // final Function onTap;
//
//   RestoDetailScreen({
//     @required this.restaurantName,
//     @required this.restaurantAdress,
//     @required this.restaurantPoint,
//     @required this.restaurantImage,
//   });
//
// //   @override
// //   _RestoDetailState createState() => _RestoDetailState();
// // }
// //
// // class _RestoDetailState extends State<RestoDetailScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     List<FoodModle> singleFoodList = [];
//     MyProvider provider = Provider.of<MyProvider>(context);
//     provider.getFoodList();
//     singleFoodList = provider.throwFoodModleList;
//
//     return Scaffold(
//       backgroundColor: Color(0xFFEEEEEE),
//       appBar: AppBar(
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(Icons.arrow_back_rounded),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MainScreen(),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//         backgroundColor: Color(0xFFD71219),
//         title: Row(
//           children: [
//             Text("Restaurant Details"),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(
//                   color: Colors.red[500],
//                 ),
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(50),
//                 ),
//               ),
//               padding: EdgeInsets.all(20),
//               // color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     width: 200,
//                     height: 200,
//                     clipBehavior: Clip.antiAlias,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     child: restaurantImage != null
//                         ? Image.network(
//                             restaurantImage,
//                             fit: BoxFit.cover,
//                           )
//                         : null,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '$restaurantName',
//                         style: TextStyle(fontSize: 30),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.green),
//                         height: 25,
//                         width: 40,
//                         child: Center(
//                           child: Text(
//                             '$restaurantPoint',
//                             style: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: Text(
//                   'Menus and Foods',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                       color: Theme.of(context).primaryColor,
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             ListView(
//               primary: false,
//               shrinkWrap: true,
//               children: singleFoodList
//                   .map(
//                     (e) => FoodWidget(
//                         foodImage: e.image,
//                         foodPrice: e.price,
//                         foodName: e.name,
//                         foodDescription: e.description,
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => FoodDetailScreen(
//                                 foodImage: e.image,
//                                 foodPrice: e.price,
//                                 foodName: e.name,
//                                 foodDescription: e.description,
//                               ),
//                             ),
//                           );
//                         }),
//                   )
//                   .toList(),
//             ),
//             // RestaurantWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }
