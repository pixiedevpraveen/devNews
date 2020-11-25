import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  static const appTitle = "Dev News";

  MyAppBar()
  : super(
        title: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Center(
                child: Text(
              appTitle,
              textScaleFactor: 2.0,
              style: TextStyle(
                color: Colors.pink[300],
                fontFamily: "RussoOne",
              ),
            ))),
        backgroundColor: Colors.pink[200],
      
  );
}