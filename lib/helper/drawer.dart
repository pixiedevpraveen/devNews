import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends Drawer {
  MyDrawer()
      : super(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: NetworkImage("https://avatars2.githubusercontent.com/u/58028638?s=400&u=4bd4ac811612698b5ced99990145070a49a522d6&v=4")??
                                Image(
                                    image:
                                        AssetImage('assets/images/image-not-found.jpg')),
                      ), // will adding an network image
                ),
              ),
            ),
            Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Center(child: Text("Praveen Yadav")),
                    subtitle: Column(
                      children: [
                        Text("Software Developer"),
                        Center(
                          child: InkWell(
                            child: Text(
                              "www.pcoder7.blogspot.com",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            onTap: () => launch("https://pcoder7.blogspot.com"),
                          ),
                        ),
                      ],
                    ),
                    tileColor: Colors.pink[50],
                  ),
                ),
              //   SizedBox(
              //   height: 20.0,
              // ),
              // ListTile(
              //   leading: CircleAvatar(
              //     child: Text(
              //       "M UI",
              //       textScaleFactor: 1.0,
              //     ),
              //     backgroundColor: Colors.pink[50],
              //     foregroundColor: Colors.black,
              //   ),
              //   title: Text("Minimal UI"),
              //   subtitle: Text("Click To Go"),
              //   tileColor: Colors.pink[100],
              //   onTap: () {
                  
              //   },
              // ),
              
              ],
            ),
            /* SizedBox(
            height: 5.0,
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text(
                "2",
                textScaleFactor: 2.0,
              ),
              backgroundColor: Colors.pink[50],
              foregroundColor: Colors.black,
            ),
            title: Text("Title 2"),
            subtitle: Text("Subtitle 2"),
            tileColor: Colors.pink[100],
            onTap: () {
              // drawerHeaderText = "You Clicked On title No: 2";
              // setState(() {});
            },
          ),
          SizedBox(
            height: 5.0,
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text(
                "R",
                textScaleFactor: 2.0,
              ),
              backgroundColor: Colors.pink[50],
              foregroundColor: Colors.black,
            ),
            title: Text("Reset"),
            subtitle: Text("Subtitle 2"),
            tileColor: Colors.pink[200],
            onTap: () {
              // drawerHeaderText = "Drawer Header";
              // setState(() {});
            },
          ) */
          ],
        ));
}
