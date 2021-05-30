import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurant_system/screens/book_screen.dart';
import 'package:restaurant_system/screens/help_screen.dart';
import 'package:restaurant_system/screens/other_screen.dart';
import 'package:restaurant_system/screens/resto_detail_screen.dart';
import 'package:restaurant_system/screens/first_screen.dart';
import 'package:restaurant_system/screens/food_detail.dart';
import 'package:restaurant_system/screens/login_screen.dart';
import 'package:restaurant_system/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant_system/screens/main_screen.dart';
import 'package:restaurant_system/screens/home_screen.dart';

import 'models/my_provider.dart';

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  //
  runApp(RestaurantSystem());
}

class RestaurantSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFFD71219),
        ),
        home: MainScreen(),
        routes: {
          FirstScreen.id: (context) => FirstScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          MainScreen.id: (context) => MainScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          BookScreen.id: (context) => BookScreen(),
          // HelpScreen.id: (context) => HelpScreen(),
          // AccountScreen.id: (context) => AccountScreen(),
          // RestoDetailScreen.id: (context) => RestoDetailScreen(),
          // FoodDetailScreen.id: (context) => FoodDetailScreen(),
        },
      ),
    );
  }
}
