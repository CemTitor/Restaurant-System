import 'package:restaurant_system/constants.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurant_system/screens/home_screen.dart';
import 'package:restaurant_system/screens/mainPage.dart';
import 'package:restaurant_system/screens/homePage.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _auth = FirebaseAuth.instance; //authentication
  String email;
  String password;
  String confirmPassword;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                  autovalidateMode: AutovalidateMode.always,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    return null;
                  },
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
                    autovalidateMode: AutovalidateMode.always,
                    controller: _passwordController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long.';
                      }
                      return null;
                    },
                    obscureText: true, // password showing us as secret
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password')),
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
                    autovalidateMode: AutovalidateMode.always,
                    controller: _confirmPasswordController,
                    validator: (String value) {
                      if (value != _passwordController.value.text) {
                        return 'Passwords do not match!';
                      }
                      return null;
                    },
                    obscureText: true, // password showing us as secret
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      confirmPassword = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Confirm your password')),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () async {
                //async olmasının nedeni kullanıcıyı yaratmadan diğer işleme geçmemesi
                try {
                  if (password == confirmPassword) {
                    //final ifadesi var because this is going to return future
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, HomeScreen.id);
                    }
                  } else {
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Passwords do not match'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                    'The passwords you entered must be the same'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Approve'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
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
