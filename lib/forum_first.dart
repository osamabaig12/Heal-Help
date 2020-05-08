import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapphealhelpversion1/forum_detial_actual.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'my_flutter_app_icons.dart';
import 'forum_second.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
import 'posts.dart';
import 'forum_actual.dart';
import 'forum_detial_actual.dart';
import 'comments_actual.dart';
import 'dart:io';
//import 'login_actual.dart';
class Posts{
  String userName;
  String userImage;
  String feedTime;
  String feedText;
  String feedImage;
  int likes;
  List comments = [];
  Posts({this.userName, this.userImage, this.feedTime, this.feedText, this.feedImage, this.likes, this.comments});
}

int length_of_comments;
int specific_post_id_whose_comment_is_made;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new ForumPage(),
    );
  }
}

final List entries = [Posts(userName: 'Azamat Zhanisov',
    userImage: 'lib/se/icons8-female-profile-100.png',
    feedTime: '3 mins ago',
    feedText: "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
    feedImage: '',
    likes: 40,
    comments: ["hello" , "hum kisi"],
), ];

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {

  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit an App'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            FlatButton(
              onPressed: () => exit(0),
              child: Text('Yes'),
            ),
          ],
        ),
      ) ??
          false;
    }
    return WillPopScope(
        onWillPop: _onBackPressed,

        child:
    StreamProvider<QuerySnapshot>.value(

      value:DatabaseService().posts,
      child: new Scaffold(
            backgroundColor: Colors.white,
            appBar:  new AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.forum, color: Color.fromRGBO(81, 200, 196, 1.0)),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        title: new Text(
          "Heal&Help",
          textScaleFactor: 1.3,
        ),
      ),

            body: ForumActual(),


          ),
    ) );

  }
/*
  void writeData()
  {
    DBRef.child("1").set({
      'id': '1',
      'chaa rahi kaali' : '2',
    });
  }
*/


}

class ForumDetailPage extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return StreamProvider<QuerySnapshot>.value(
      value:DatabaseService().posts,
      child: new Scaffold(

          appBar: new AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
            title: new Text(
              "Heal&Help",
              textScaleFactor: 1.3,
            ),
          ),
          body: ForumDetailActual(),


        ),
    );
  }
}
class CommentsScreen extends StatelessWidget {
  int current_index = 0;
  String post = 'How are you';
  final List<Widget> children = [];
  final _formKey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context) {

    var queryData = MediaQuery.of(context);
    String post_content = '';


    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().posts,
      child: new Scaffold(

        appBar: new AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
          title: new Text(
            "Heal&Help",
            textScaleFactor: 1.3,
          ),
        ),
        body: CommentsActual(),



      ),
    );
  }


}
