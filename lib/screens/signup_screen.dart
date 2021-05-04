import 'package:restaurant_system/constants.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurant_system/screens/first_screen.dart';
import 'package:restaurant_system/screens/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_system/models/userr.dart';

final _firestore = FirebaseFirestore.instance;

class SignupScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  //
  final _auth = FirebaseAuth.instance; //authentication

  // String email;
  // String password;
  // String confirmPassword;
  // String name;
  // String surname;
  Userr user1 = new Userr();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Future sendData()

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
                // color: Colors.blue,
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
                      user1.email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email'),
                  ),
                ),
              ), //email
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
                        user1.password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your password')),
                ),
              ), //password
              SizedBox(
                height: 8.0,
              ),
              Card(
                color: Color(0xFFD71219),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
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
                        user1.confirmPassword = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Confirm your password')),
                ),
              ), //confirm pass
              SizedBox(
                height: 24.0,
              ),
              Card(
                color: Color(0xFFD71219),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  leading: Icon(
                    Icons.drive_file_rename_outline,
                    color: Color(0xFFD71219),
                  ),
                  tileColor: Colors.white,
                  title: TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        user1.name = value;
                      },
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: 'Name')),
                ),
              ), //name
              SizedBox(
                height: 24.0,
              ),
              Card(
                color: Color(0xFFD71219),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  leading: Icon(
                    Icons.drive_file_rename_outline,
                    color: Color(0xFFD71219),
                  ),
                  tileColor: Colors.white,
                  title: TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        user1.surname = value;
                      },
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: 'Surname')),
                ),
              ), //surname
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register',
                colour: Colors.white,
                onPressed: () async {
                  //async olmasının nedeni kullanıcıyı yaratmadan diğer işleme geçmemesi
                  try {
                    if (user1.password == user1.confirmPassword) {
                      //final ifadesi var because this is going to return future
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: user1.email, password: user1.password);
                      // _firestore.collection('users').doc('name').snapshots();
                      _firestore
                          .collection('users')
                          .doc(_auth.currentUser.uid)
                          .set({
                        'email': user1.email,
                        'password': user1.password,
                        'name': user1.name,
                        'surname': user1.surname,
                      });
                      // _firestore.collection('users').add({
                      //   'email': _auth.currentUser.email,
                      //   'password': password,
                      //   'name': name,
                      //   'surname': surname,
                      // });
                      if (newUser != null) {
                        Navigator.pushNamed(context, FirstScreen.id);
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
                                  Navigator.pushNamed(context, MainScreen.id);
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
      ),
    );
  }
}
