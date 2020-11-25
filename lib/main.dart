import 'package:devnews/screens/home_page.dart';
import 'package:flutter/material.dart';

// import 'package:devnews/devnews_pages/homepage.dart';

void main() => runApp(MyApp());
var appTitle = "Dev News";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomePage(),
    );
  }
}
