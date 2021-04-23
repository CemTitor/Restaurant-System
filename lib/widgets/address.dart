import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text('Ev(adres ismi)'),
              subtitle: Text('Bursa(açık adres)'),
              trailing: Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            height: double.infinity,
            color: Colors.orange,
            child: Center(
              child: Text(
                'List \n Restaurants',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
