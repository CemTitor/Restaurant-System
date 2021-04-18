import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Color(0xFFD71219),
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

const kLabelTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.black,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  // border: OutlineInputBorder(
  //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
  // ),
  // enabledBorder: OutlineInputBorder(
  //   borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
  //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
  // ),
  // focusedBorder: OutlineInputBorder(
  //   borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
  //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
  // ),
);
