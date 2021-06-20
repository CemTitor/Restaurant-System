import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/models/cart_modle.dart';
import 'package:restaurant_system/models/dessert_modle.dart';
import 'package:restaurant_system/models/drink_modle.dart';
import 'food_modle.dart';
import 'package:restaurant_system/models/food_modle.dart';
import 'drink_modle.dart';

class MyProvider extends ChangeNotifier {


  List<FoodModle> foodModleList = [];
  FoodModle foodModle;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> getFoodList() async {
    List<FoodModle> newfoodModleList = [];


    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('foods').get();
    querySnapshot.docs.forEach((element) {
      foodModle = FoodModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
      //  description: element.data()['description'],
      );



      newfoodModleList.add(foodModle);
    });


    foodModleList = newfoodModleList;
  }

  get throwFoodModleList {
    return foodModleList;
  }
  //
  // /////RestoList/////****
  // List<RestoList> restlist = [];
  // RestoList rest;
  // Future<void> getRList() async {
  //   List<RestoList> newRestoList = [];
  //   QuerySnapshot querySnapshot =
  //       await FirebaseFirestore.instance.collection('restlist').get();
  //   querySnapshot.docs.forEach((element) {
  //     rest = RestoList(
  //       adres: element.data()['adres'],
  //       name: element.data()['name'],
  //       point: element.data()['point'],
  //       restaurantImage: element.data()['image'],
  //     );
  //
  //     newRestoList.add(rest);
  //   });
  //
  //   restlist = newRestoList;
  // }
  //
  // get throwrestlist {
  //   return restlist;
  // }
  /////DrinkList////////
  List<DrinkModle> drinkModleList =[];
  DrinkModle drinkModle;
  Future<void> getDrinkList() async {
    List<DrinkModle> newdrinkModleList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('drinks').get();
    querySnapshot.docs.forEach((element) {
      drinkModle = DrinkModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
        //  description: element.data()['description'],
      );
      newdrinkModleList.add(drinkModle);

    });


    drinkModleList = newdrinkModleList;
  }
  get throwDrinkModleList {
    return drinkModleList;
  }

  ////DessertList//////
  List<DessertModle> dessertModleList =[];
  DessertModle dessertModle;
  Future<void> getDessertList() async {
    List<DessertModle> newdessertModleList = [];

    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('desserts').get();
    querySnapshot.docs.forEach((element) {
      dessertModle = DessertModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
        //  description: element.data()['description'],
      );
      newdessertModleList.add(dessertModle);
    });
   


    dessertModleList = newdessertModleList;
  }

  get throwDessertModleList {
    return dessertModleList;
  }

  /////FAVORITES////////
  List<FoodModle> favorilist = [];
  FoodModle foodModle1;

  Future<void> getFavoriList() async {
    List<FoodModle> newfavoriList = [];


    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('favourites').get();
    querySnapshot.docs.forEach((element) {
      foodModle1 = FoodModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
        //  description: element.data()['description'],
      );



     newfavoriList.add(foodModle1);
    });


    favorilist = newfavoriList;
  }

  get throwfavoriList {
    return favorilist;
  }


  //////PREVIOUS ORDERRRR /////////

  //
  // List<FoodModle> prevorderList = [];
  // FoodModle perorder1;
  //
  // Future<void> getprevOrderlist() async {
  //   List<FoodModle> newprevorderList= [];
  //
  //
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('pordersbyuser').get();
  //
  //
  //   querySnapshot.docs.forEach((element) {
  //       perorder1 = FoodModle(
  //
  //       image: element.data()['image'],
  //       name: element.data()['name'],
  //       price: element.data()['price'],
  //       //  description: element.data()['description'],
  //     );
  //
  //
  //
  //     newprevorderList.add(element.d;
  //   });
  //   print("PrevORDERDAYIZZZZ");
  //   print(newprevorderList[0].name.toString());
  //   print(newprevorderList[0].name);
  //   print(newprevorderList[1].name);
  //
  //
  //   print("PrevORDERDAYIZZZasdasdasdaZ");
  //
  //
  //   prevorderList=newprevorderList;
  // }
  //
  // get throwprevOrderlist {
  //   return prevorderList;
  // }




  ////PREVVV ORDER 2 /////
  List prevOrderList = [];
  Future<void> getprevList() async {
    List newprevOrderList = [];




    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('pordersbyuser').get();
    querySnapshot.docs.forEach((element) {

      newprevOrderList.add(element);



    });

    prevOrderList=newprevOrderList;





  }

  get throwPrevOrderList {
    return prevOrderList;
  }







/////////////////////add to cart///////////////7

  List<CartModle> cartList = [];
  List<CartModle> newCartList = [];

  CartModle cartModle;

  void addToCart({
    @required String image,
    @required String name,
    @required int price,
    @required int quantity,
  }) {
    cartModle = CartModle(image, name, price, quantity);
    newCartList.add(cartModle);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }

  int totalprice() {
    int total = 1;
    cartList.forEach((element) {
      total = element.price * element.quantity;
    });
    return total;
  }

  int deleteIndex;
  void getDeleteIndex(int index) {
    deleteIndex = index;
  }

  void delete() {
    cartList.removeAt(deleteIndex);
    notifyListeners();
  }
}
