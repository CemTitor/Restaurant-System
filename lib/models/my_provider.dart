import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_system/models/resto_list.dart';

import 'food_modle.dart';
import 'package:restaurant_system/models/food_modle.dart';


class MyProvider extends ChangeNotifier{
  List<FoodModle> foodModleList=[];
  FoodModle foodModle;
  Future<void> getFoodList()async{
    List<FoodModle> newfoodModleList=[];

    QuerySnapshot querySnapshot =await FirebaseFirestore.instance.collection('foods').get();
    querySnapshot.docs.forEach((element) {
      foodModle  = FoodModle(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price'],
      );
      newfoodModleList.add(foodModle);

    });

    foodModleList=newfoodModleList;

  }
  get throwFoodModleList{
    return foodModleList;
  }
  /////RestoList/////****
List<RestoList> restlist=[];
  RestoList rest;
  Future<void> getRList() async{
    List<RestoList> newRestoList=[];
    QuerySnapshot querySnapshot =await FirebaseFirestore.instance.collection('restlist').get();
    querySnapshot.docs.forEach((element) {
       rest = RestoList(
        adres: element.data()['adres'],
        name: element.data()['name'],
        point: element.data()['point'],
      );

       newRestoList.add(rest);

    });

    restlist=newRestoList;

  }
  get throwrestlist{
    return restlist;
  }

  }





