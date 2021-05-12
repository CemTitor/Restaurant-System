import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  static const String id = 'book_screen';
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Text('Book Screen'),
      ),
    );
  }
}
