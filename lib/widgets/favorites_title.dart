import 'package:flutter/material.dart';

class FavoritesTitle extends StatelessWidget {
  const FavoritesTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Chef's Advice Menu's ",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            color: Colors.grey,
            size: 30,
          )
        ],
      ),
    );
  }
}
