import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutterapphealhelpversion1/signUpInformation.dart';
import 'auth.dart';
//import 'login.dart';
import 'database.dart';
import 'package:provider/provider.dart';
import 'login_actual.dart';
import 'forum_first.dart';

class ForumDetailActual extends StatefulWidget {
  @override
  _ForumDetailActualState createState() => _ForumDetailActualState();
}

class _ForumDetailActualState extends State<ForumDetailActual> {
  int current_index = 0;
  String post = 'How are you';
  final List<Widget> children = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<QuerySnapshot>(context);
    var queryData = MediaQuery.of(context);
    String post_content = '';

    return new Scaffold(
        body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {

          return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Create a Post", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(81, 200, 196, 1.0), fontSize:
                            35.0), )
                          ],
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              width: queryData.size.width/3,
                              padding: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.greenAccent,
                                color: Color.fromRGBO(81, 200, 196, 1.0),
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {Navigator.pushNamed(context, '/forum');},
                                  child: Center(
                                    child: Text(
                                      'back',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              ),

                            ),
                            SizedBox(width: queryData.size.width/3),
                            Container(
                              height: 100.0,
                              width: queryData.size.width/3,
                              padding: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.greenAccent,
                                color: Color.fromRGBO(81, 200, 196, 1.0),
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () async {
                                    if(_formKey.currentState.validate()) {
                                      _formKey.currentState.save();

                                      /*entries.add(Posts(userName: username,
                                             userImage: 'lib/se/icons8-male-user-150.png',
                                             feedTime: '1 s ago',
                                             feedText: post_content,
                                             feedImage: '',
                                             likes: 0
                                         )

                                          //   Navigator.pushNamed(context, '/forum');
                                         );
                                         */
                                      //await DatabaseService(uid: user.uid);// This has to be added in LOGIN AND SIGNUP!!!!!!
                                      /*<------------------------------------------------------------------------->*/
                                      // Access data from database and find out the id of latest post made so far
                                      //StreamProvider<QuerySnapshot>.value(value: DatabaseService().posts);
                                      //final posts = Provider.of<QuerySnapshot>(context, listen: false);

                                      List comments_of_added_post = ["Hello to comment section"];
                                      List user_ids_commenting = ["Heal&Help"];
                                      if(posts.documents.length == 0){
                                        print("YAHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAN");
                                        await DatabaseService(uid : user.uid).addUserPostData( 0, user.uid, userName, post_content, 0, comments_of_added_post, user_ids_commenting);
                                      }
                                      else {

                                        int latest_post_id = (posts.documents[posts.documents.length - 1].data['post_id']);
                                        //List dummyComments = ["Ya Allah SE pass kara day" , "Please khudaya sun lay"];

                                        await DatabaseService(uid: user.uid)
                                            .addUserPostData(
                                            latest_post_id+1, user.uid, userName,
                                            post_content, 0,
                                            comments_of_added_post, user_ids_commenting);
                                      }
                                      Navigator.pushNamed(context, '/forum');
                                    }
                                    //Navigator.pop(context, post);
                                    //Navigator.pushNamed(context, '/forum');
                                  },
                                  child: Center(
                                    child: Text(
                                      'post',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              ),

                            )
                          ]
                      ),

                      Row(
                        children: <Widget>[
                          SizedBox(width: 10,),
                          Image(

                            image: AssetImage('lib/se/icons8-male-user-150.png'),
                            height: 50,

                          ),
                          SizedBox(width: queryData.size.width/20),
                          Text(
                            userName,
                            style: TextStyle(
                                color: Color.fromRGBO(81, 200, 196, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Montserrat'),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: queryData.size.width/20),
                            Container(
                                height: queryData.size.height/5,
                                width: queryData.size.width/1.1225,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color.fromRGBO(81, 200, 196, 1.0), width: 2),


                                ),
                                child:  Form(
                                  key: _formKey,

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: <Widget>[
                                      TextFormField(

                                        style:TextStyle(
                                            fontSize: 20.0,
                                            height: 3.0,
                                            color: Colors.black
                                        ),
                                        decoration: const InputDecoration(
                                          //icon: Icon(Icons.person),
                                          contentPadding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 0),
                                          border: InputBorder.none,
                                          hintText: 'Please type in your post here',

                                        ),
                                        validator: (value){
                                          if (value == null || value.isEmpty) {
                                            return 'Posts can\'t be empty.';
                                          }
                                          return null;

                                        },
                                        onSaved: (val) => post_content = val,

                                      ),

                                    ],
                                  ),
                                )
                            ),
                            SizedBox(width: queryData.size.width/20)
                          ]
                      ),

                    ] ),
              )
          );
        }
    ));
  }
}
