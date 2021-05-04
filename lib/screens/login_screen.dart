import 'package:restaurant_system/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurant_system/screens/main_screen.dart';

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
      backgroundColor: Color(0xFFD71219),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset(
                    'images/resto2.png',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Card(
                color: Color(0xFFD71219),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  leading: Icon(
                    Icons.email,
                    color: Color(0xFFD71219),
                  ),
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
                color: Color(0xFFD71219),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  leading: Icon(
                    Icons.lock,
                    color: Color(0xFFD71219),
                  ),
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
                colour: Colors.white,
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, MainScreen.id);
                    }
                  } catch (Exception) {
                    print(Exception);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
