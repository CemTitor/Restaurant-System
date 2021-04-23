import 'package:flutter/material.dart';
import 'package:restaurant_system/screens/book_screen.dart';
import '../constants.dart';

class BookNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, BookScreen.id);
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.calendar_today,
              size: 180,
              color: Color(0xFFD71219),
            ),
            Text(
              "Book Now!",
              style: kSendButtonTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
