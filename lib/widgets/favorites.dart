import 'package:flutter/material.dart';
import 'package:restaurant_system/widgets/restaurant_widget.dart';


class RestaurantWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            Restaurant('Dominos Pizza', 'Bursa Nilüfer', 9.5),
            SizedBox(
              height: 5,
            ),
            Restaurant('Burger King', 'Ankara Atatürk Mah.', 8.4),
            SizedBox(
              height: 5,
            ),
            Restaurant('Dönerci Haşim Usta', 'Bilmemne Sokak', 7.2),
          ],
        ),
      ),
    );
  }
}
