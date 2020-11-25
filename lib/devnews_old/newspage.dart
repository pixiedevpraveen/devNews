import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  final appTitle = "Dev News";
  final article;

  const NewsPage({Key key, @required this.article}) : super(key: key);
  final textColor = Colors.black;
/* 

strDrink = title
idDrink = description
strDrinkThumb = urlToImage
new content (news content)

 */

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.teal[200],
        Colors.lightBlue[100],
        Colors.purple[200],
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(child: Text(article["title"],
            style: TextStyle(
                    fontSize: 22,
                    color: textColor,
                  ),
          )),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: article["description"],
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(article["urlToImage"]),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${article["title"]}",
                  style: TextStyle(
                    fontSize: 22,
                    color: textColor,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(
                  "Author: ${article["author"]}",
                  style: TextStyle(
                    fontSize: 15,
                    color: textColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Published At: ${article["publishedAt"]}",
                  style: TextStyle(
                    fontSize: 10,
                    color: textColor,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Description: ${article["description"]}",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(
                  "content: ${article["content"]}",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
              Center(
                // widthFactor: 2.0,
                // heightFactor: 2.0,
                child: RaisedButton(onPressed: null,
                  child: InkWell(
                    child: Text(
                      "  Read full News  ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    /* Text(
                      article['url'],
                      
                    ),*/
                    onTap: () => launch(article['url']),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
