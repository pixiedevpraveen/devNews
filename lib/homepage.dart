import 'package:flutter/material.dart';
import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:devnews/newspage.dart';

import 'appbar.dart';
import 'drawer.dart'; // drink Detail

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appTitle = "Dev News";
  var apiLink =
      "http://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=53c1ce6459854f7893bee3202dc16895";
  var res, newsApiOb;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    res = await http.get(apiLink);
    newsApiOb = jsonDecode(res.body);
    // drinks = jsonDecode(res.body)["drinks"];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.pink[50],
          Colors.red[50],
        ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: res != null
                ? ListView.builder(
                    itemCount: newsApiOb["totalResults"],
                    itemBuilder: (context, index) {
                      var article = newsApiOb["articles"][index];
                      return ListTile(
                        leading: Hero(
                          tag: article["title"],
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                    article["urlToImage"]) ??
                                Image(
                                    image: AssetImage(
                                        'assets/images/image-not-found.jpg')),
                          ),
                        ),
                        title: Text(
                          "${article["title"]}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text("Author: ${article["author"]}"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NewsPage(article: article),
                                fullscreenDialog: true,
                              ));
                        },
                      );
                    })
                : CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
          ),
        ),
      ),
    );
  }
}
