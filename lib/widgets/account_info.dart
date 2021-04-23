import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset(
                  "images/popcorn.png",
                  //TODO: add user photo insted of popcorn
                  height: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "0 Point",
                      style: TextStyle(color: Colors.white),
                    ),
                    //TODO: add user info from database
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'images/trophy.png',
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
