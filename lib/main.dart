import 'package:flutter/material.dart';

import 'package:devnews/homepage.dart';

void main() => runApp(MyApp());
var appTitle = "Dev News";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomePage(),
      theme: ThemeData(fontFamily: 'roboto'),
    );
  }
}
