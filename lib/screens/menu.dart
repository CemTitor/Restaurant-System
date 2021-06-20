import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/models/dessert_modle.dart';
import 'package:restaurant_system/models/drink_modle.dart';
import 'package:restaurant_system/models/status_service.dart';
import 'package:restaurant_system/screens/dessert_detail.dart';
import 'package:restaurant_system/screens/drink_detail.dart';
import 'package:restaurant_system/screens/home_screen.dart';
import 'package:restaurant_system/widgets/dessert_widget.dart';
import 'package:restaurant_system/widgets/drink_widget.dart';
import 'package:restaurant_system/widgets/food_widget.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/models/food_modle.dart';
import 'package:restaurant_system/models/my_provider.dart';
import '../widgets/food_widget.dart';
import 'food_detail.dart';
import 'main_screen.dart';

class menu extends StatelessWidget {
  static const String id = 'menu_screen';




  /* final String restaurantName;
  final String restaurantAdress;
  final int restaurantPoint;
  final String restaurantImage;
  // final Function onTap;

  RestoDetailScreen({
    @required this.restaurantName,
    @required this.restaurantAdress,
    @required this.restaurantPoint,
    @required this.restaurantImage,
  });


   */
//   @override
//   _RestoDetailState createState() => _RestoDetailState();
// }
//
// class _RestoDetailState extends State<RestoDetailScreen> {

  @override
  Widget build(BuildContext context) {
    List<FoodModle> singleFoodList = [];
    List<DrinkModle> singleDrinkList=[];
    List<DessertModle> singleDessertList=[];
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getFoodList();
    provider.getDrinkList();
    provider.getDessertList();
    provider.getprevList();
    singleFoodList = provider.throwFoodModleList;
    singleDrinkList = provider.throwDrinkModleList;
    singleDessertList=provider.throwDessertModleList;


    // provider.getprevOrderlist();
    // singleprevOrderlist = provider.throwDessertModleList;
    // print(singleprevOrderlist[0].name);





    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
              },
            );
          },
        ),
        backgroundColor: Color(0xFFD71219),
        title: Row(
          children: [
            Text("Menu"),
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
             /*     Container(
                    width: 200,
                    height: 200,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                   child: restaurantImage != null
                        ? Image.network(
                      restaurantImage,
                      fit: BoxFit.cover,
                    )
                        : null,
                  ),

              */
               /*         Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$restaurantName',
                        style: TextStyle(fontSize: 30),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        height: 25,
                        width: 40,
                        child: Center(
                          child: Text(
                            '$restaurantPoint',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),


                */
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Foods',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              children: singleFoodList
                  .map(
                    (e) => FoodWidget(
                    foodImage: e.image,
                    foodPrice: e.price,
                    foodName: e.name,
                  //  foodDescription: e.description,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailScreen(
                            foodImage: e.image,
                            foodPrice: e.price,
                            foodName: e.name,
                        //    foodDescription: e.description,
                          ),
                        ),
                      );
                    }),
              )
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Drinks',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView(
              primary: true,
              shrinkWrap: true,
              children: singleDrinkList
                  .map(
                    (e) => DrinkWidget(
                    drinkImage: e.image,
                    drinkPrice: e.price,
                    drinkName: e.name,
                  //  foodDescription: e.description,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DrinkDetailScreen(
                            drinkImage: e.image,
                            drinkPrice: e.price,
                           drinkName: e.name,
                        //    foodDescription: e.description,
                          ),
                        ),
                      );
                    }),
              )
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Desserts',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              children: singleDessertList
                  .map(
                    (e) => DessertWidget(
                    dessertImage: e.image,
                    dessertPrice: e.price,
                    dessertName: e.name,
                  //  foodDescription: e.description,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DessertDetailScreen(
                            dessertImage: e.image,
                            dessertPrice: e.price,
                            dessertName: e.name,
                        //    foodDescription: e.description,
                          ),
                        ),
                      );
                    }),
              )
                  .toList(),
            ),
            // RestaurantWidget(),
          ],
        ),
      ),
    );
  }
}
