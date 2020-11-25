// import 'package:cached_network_image/cached_network_image.dart';
import 'package:devnews/helper/drawer.dart';
import 'package:flutter/material.dart';
import 'package:devnews/helper/data.dart';
import 'package:devnews/helper/widgets.dart';
import 'package:devnews/models/categorie_model.dart';
// import 'package:devnews/screens/categorie_news.dart';
import 'package:devnews/helper/news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading;
  var newslist;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<CategorieModel> categories = List<CategorieModel>();

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();

    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Dev",
                              style: TextStyle(
                                  color: Color(0xFF923dc1),
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "News",
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      // background: Image.asset("assets/images/bg.png", fit: BoxFit.cover,),
                    ),
                    expandedHeight: 200.0,
                    leading: IconButton(
                      icon: Icon(Icons.menu_outlined),
                      color: Colors.black38,
                      onPressed: () => _scaffoldKey.currentState.openDrawer(),
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 332.0,
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return NewsTile(
                          imgUrl: newslist[index].urlToImage ?? "",
                          title: newslist[index].title ?? "",
                          desc: newslist[index].description ?? "",
                          content: newslist[index].content ?? "",
                          posturl: newslist[index].articleUrl ?? "",
                        );
                      },
                      childCount: newslist.length,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
/* 
class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({this.imageAssetUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryNews(
            newsCategory: categoryName.toLowerCase(),
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                color: Colors.black26
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
 */
