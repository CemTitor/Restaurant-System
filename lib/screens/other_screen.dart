import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/screens/first_screen.dart';
import 'package:restaurant_system/screens/my_address_screen.dart';
import 'package:restaurant_system/screens/my_profile_screen.dart';
import 'package:restaurant_system/screens/previous_orders_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class OtherScreen extends StatelessWidget {
  static const String id = 'otherScreen';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Other Screen"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.orange,
                  size: 135,
                ),
                title: Text(
                  'My Profile',
                  style: TextStyle(fontSize: 25),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyAdressScreen(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.follow_the_signs,
                  size: 135,
                  color: Colors.green,
                ),
                title: Text(
                  'My Adresses',
                  style: TextStyle(fontSize: 25),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviousOrdersScreen(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.settings_backup_restore,
                  size: 135,
                  color: Colors.red,
                ),
                title: Text(
                  'Previous Orders',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFFD71219),
                  ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 25,
                  color: Color(0xFFD71219),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstScreen(),
                  ),
                );
              },
              child: const Text(
                'Sign Out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD71219),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} //some problems gonna fix
