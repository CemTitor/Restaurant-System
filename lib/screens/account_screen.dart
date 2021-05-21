import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  static const String id = 'accountScreen';
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Account Screen"),
      ),
    );
  }
} //some problems gonna fix
