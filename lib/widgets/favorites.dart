import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/models/my_provider.dart';
import 'package:restaurant_system/models/resto_list.dart';
import 'package:restaurant_system/widgets/restaurant_widget.dart';


class RestaurantWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<RestoList> R1 = [];
    MyProvider provider1 = Provider.of<MyProvider>(context);

    R1 = provider1.throwrestlist;

    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Favorite Restaurants',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.grey,
                    size: 30,
                  )
                ],
              ),
            ),
           ListView(
               padding: const EdgeInsets.fromLTRB(
                 16.0,
                 kToolbarHeight + 40.0,
                 16.0,
                 16.0,

               ),

               children:  R1.map(
                   (e) => Restaurant(e.name,e.adres,e.point),
             ).toList()
           )
          ],
        ),
      ),
    );
  }
}
