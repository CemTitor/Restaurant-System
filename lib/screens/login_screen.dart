import 'package:restaurant_system/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurant_system/screens/home_screen.dart';
import 'package:restaurant_system/screens/mainPage.dart';
import 'package:restaurant_system/screens/homePage.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance; //authentication
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/resto2.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              color: Colors.blue,
              child: ListTile(
                leading: Icon(Icons.email),
                tileColor: Colors.white,
                title: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              color: Colors.blue,
              child: ListTile(
                leading: Icon(Icons.lock),
                tileColor: Colors.white,
                title: TextFormField(
                  obscureText: true, // password showing us as secret
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password'),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    Navigator.pushNamed(context, HomeScreen.id);
                  }
                } catch (Exception) {
                  print(Exception);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
