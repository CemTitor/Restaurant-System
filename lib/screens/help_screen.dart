import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  static const String id = 'helpScreen';
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Help Screen"),
      ),
    );
  }
} //some problems gonna fix
