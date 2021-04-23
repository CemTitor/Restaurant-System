import 'package:flutter/material.dart';

class PreviousOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                height: 25,
                width: 40,
                child: Center(
                  child: Text(
                    '9.9',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Text(
                'Dominos Pizza, Nilüfer(Atatürk Mah.)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '1 month ago',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ignore: deprecated_member_use
              FlatButton.icon(
                  height: 1,
                  onPressed: null,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Details',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
              // ignore: deprecated_member_use
              OutlineButton.icon(
                icon: Icon(
                  Icons.sync,
                  size: 15,
                  color: Colors.lightGreen,
                ),
                label: Text(
                  'Repeat',
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
                onPressed: null,
              )
            ],
          ),
        ],
      ),
    );
  }
}
