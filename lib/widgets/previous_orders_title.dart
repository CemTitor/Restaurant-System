import 'package:flutter/material.dart';

class PreviousOrdersTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Previous Orders',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Image.asset('images/chat.png', height: 15),
                    SizedBox(width: 5),
                    Text('You have 5 unrecognized orders.')
                  ],
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 3),
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.grey,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
