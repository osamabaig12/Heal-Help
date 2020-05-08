import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'my_flutter_app_icons.dart';
import 'forum_second.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapphealhelpversion1/database.dart';
import 'package:provider/provider.dart';
import 'auth.dart';

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
void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForumPage(),
    )
);

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
  final DBRef = FirebaseDatabase.instance.reference();
  @override
  String result = '';
  int _curIndex = 0;
  final formKey = GlobalKey<FormState>();
/*  makeFeed(
  userName: 'Azamat Zhanisov',
  userImage: 'lib/se/icons8-female-profile-100.png',
  feedTime: '3 mins ago',
  feedText: "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
  feedImage: ''
  ),
*/
  final List<int> colorCodes = <int>[600, 500, 100, 200];
  bool enabled = false;
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        title: new Text(
          "Heal&Help",
          textScaleFactor: 1.3,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
                child: TextField(
                  textAlign: TextAlign.start,
                  //onTap: (){},
                  decoration: InputDecoration(
                    //prefixIcon: Icon(Icons.search, color: Colors.grey,),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0),fontSize: 22,fontWeight: FontWeight.bold, ),
                    hintText: "Hello! Hope you're doing great today!",

                  ),
                )
            ),
            Container(
              height: 100,
              width: queryData.size.width/1.55,
              padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 50),
              child: Row(
                children: <Widget>[
                  /*Expanded(
                    child: Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[200]
                      ),
                      child: Text(
                        ),
                      ),
                    ),
                  ),*/
                  Expanded(
                    child: Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(81, 200, 196, 1.0)
                      ),
                      child: TextField(
                        onTap: (){},
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: Icon(Icons.search),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, '/forum');
                            },
                          ),//Icon(Icons.search, color: Colors.white,),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Monterrat'),
                          hintText: "Search for a Post",
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(width: 20,),
                  /*Icon(Icons.camera_alt, color: Colors.grey[800], size: 30,)*/
                ],
              ),
              //HERE WE'LL ADD CREATE POST BAR

            ),

            Container(
              height: 90,

              padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 20),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image(image: AssetImage('lib/se/icons8-male-user-150.png')),

                  //Icon(Icons.person, color: Colors.grey,),
                  SizedBox(width: queryData.size.width/20,),
                  Expanded(
                    child: Container(
                      width: queryData.size.width/1.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,

                        border: Border.all(
                          color: Color.fromRGBO(81, 200, 196, 1.0),
                          width: 2,
                        ),
                      ),
                      //shape: BoxShape.circle,


                      child: TextField(
                        onTap: () async {
                          print("WHATS");
                          result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForumDetailPage()),
                          );
                          //Navigator.of(context).pushNamed('/forumpost');

                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          //prefixIcon: Icon(Icons.search, color: Colors.grey,),

                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0),fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                          hintText: "Wht's on your mind?",
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              //HERE WE'LL ADD CREATE POST BAR

            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //<< any widgets added
                Container(
                    height: queryData.size.height/2.5,
                    child: ListView.builder(

                      //scrollDirection: Axis.vertical,
                      //shrinkWrap: true,
                      //here your code
                      scrollDirection: Axis.vertical,
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return makeFeed(
                          userName: (entries[index].userName).toString(),
                          userImage : (entries[index].userImage),
                          feedTime: (entries[index].feedTime).toString(),
                          feedText: (entries[index].feedText).toString(),
                          feedImage : (entries[index].feedImage).toString(),
                          likes:  (entries[index].likes).toString(),
                          index_of_post : index,

                        );/*Container(
                              height: 100,
                              color: Colors.amber[colorCodes[index]],
                              child: Center(child: Text('Entry ${entries[index]}')),
                              );*/
                      },
                      //separatorBuilder: (BuildContext context, int index) => const Divider(),
                    )
                ),

                //Divider(),//<< any widgets added
              ],
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        //backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        items:
        [
          BottomNavigationBarItem(
            icon: new Icon(Icons.spa,color: Colors.white,size: 50,),
            title: Text(' ',style: TextStyle(color: _curIndex == 0 ? Colors.white : Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.show_chart,color: Colors.white,size: 50,),
            title: Text(' '),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home,color: Colors.white,size: 50,),
            title: Text(' '),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.message,color: Colors.white,size: 50,),
            title: Text(' ',),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings,color: Colors.white,size: 50,),
            title: Text(' '),
          ),
        ],
        currentIndex: _curIndex,
        onTap: (index) {
          setState(() {
            _curIndex = index;
            switch (_curIndex) {
              case 0:
                Navigator.of(context).pushNamed('/inhale');
                break;
              case 1:
                Navigator.of(context).pushNamed('/login');
                break;
              case 2:
                Navigator.of(context).pushNamed('/forum');
                break;
              case 3:
                Navigator.of(context).pushNamed('/chat');
                break;
              case 4:
                Navigator.of(context).pushNamed('/inhale');
                break;
            }
          });
        },
      ),
    );

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

  Widget makeFeed({userName, userImage, feedTime, feedText, feedImage, likes,index_of_post}) {
    var queryData = MediaQuery.of(context);

    int pos;
    return Container(
      margin: EdgeInsets.only(right: 20 ,left:20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        image: DecorationImage(
                          image: AssetImage(userImage),

                          //fit: BoxFit.cover
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(userName, style: TextStyle(color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),),
                      SizedBox(height: 3,),
                      Text(feedTime, style: TextStyle(fontSize: 15, color: Colors.grey),),
                    ],
                  )
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_horiz, size: 30, color: Color.fromRGBO(81, 200, 196, 1.0),),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Report User?', style: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0), fontWeight: FontWeight.bold, fontSize: 30),),
                      actions: <Widget>[
                        MaterialButton(
                          elevation: 5.0,
                          color: Color.fromRGBO(81, 200, 196, 1.0),
                          height: 30.0,
                          minWidth: 30.0,
                          child: Text("Report", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        )
                      ],

                    ),
                  );
                },
              )
            ],
          ),
          SizedBox(height: 20,),
          Text(feedText, style: TextStyle(fontSize: 15, color: Colors.grey[800], height: 1.5, letterSpacing: .7),),
          SizedBox(height: 20,),
          feedImage != '' ?
          Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(feedImage),
                    fit: BoxFit.cover
                )
            ),
          ) : Container(),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Row(
                //key: ,
                children: <Widget>[
                  makeLike(),
                  Transform.translate(
                    offset: Offset(-5, 0),
                  ),
                  SizedBox(width: 5,),

                  Text('$likes', style: TextStyle(fontSize: 15, color: Colors.grey[800]),)
                ],
              ),
              Text("400 Comments", style: TextStyle(fontSize: 13, color: Colors.grey[800]),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: (enabled
                              ? Color.fromRGBO(81, 200, 196, 1.0) : Colors.white
                          ),
                          border: Border.all(color: Color.fromRGBO(81, 200, 196, 1.0),width: 2,),
                          //borderRadius: BorderRadius.circular(50),
                        ),
                        child: GestureDetector(

                          child: Center(

                            child: Row(

                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: queryData.size.width/10,
                                ),
                                Icon(Icons.thumb_up, color: Color.fromRGBO(81, 200, 196, 1.0), size: 18),
                                SizedBox(width: queryData.size.width/40,),
                                //Text("Like", style: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0)),textAlign: TextAlign.center,),
                                Text("Like", style: TextStyle(color: enabled
                                    ? Colors.white : Color.fromRGBO(81, 200, 196, 1.0) ,),textAlign: TextAlign.center, ),

                                SizedBox(width: queryData.size.width/9,
                                ),
                              ],
                            ),
                          ),
                          onTap:  ()  {
                            print("here");
                            setState(() {
                              int y = int.parse(likes);
                              y++;
                              print(y);
                              likes = int.parse(likes);
                              likes = y;
                              //likes = y.toString();
                              print(likes);
                              entries[index_of_post].likes = likes;
                              enabled = true;

                            });

                          },
                        )
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromRGBO(81, 200, 196, 1.0),width: 2,),
                          //borderRadius: BorderRadius.circular(50),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            //here a for loop will come which will check that comment button for whic post has been clickd
                            // How to check the post id
                            length_of_comments = entries[index_of_post].comments.length;
                            specific_post_id_whose_comment_is_made = index_of_post;
                            result = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CommentsScreen()) );

                            //here we shall add dialog box
                            /*showDialog(
        context: context,
        builder: (context) => AlertDialog(

          title: Text('Comments', style: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0), fontWeight: FontWeight.bold, fontSize: 30),),
          actions: <Widget>[


            Column(
               //direction: Axis.vertical,
              mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 Container(
                     height: queryData.size.height/2.5,
                     child: ListView.builder(
                         scrollDirection: Axis.vertical,
                         shrinkWrap: true,
                         //here your code
                         //scrollDirection: Axis.vertical,
                         itemCount: entries.length,
                         itemBuilder: (BuildContext context, int index) {
                           if (username == entries[index].userName) {

                             for(int i = 0 ; i < entries[index].comments.length ; i++)
                             {
                               return makeComments(entries[index].comments[i]);
                             };
                           }
                         }
                     ),
                   ),

               ],

            ),
        //  int x = 0;
*//*
          if ( x == 1)
      {
        Container(
          alignment: Alignment.center,
          child:
          Text(entries[pos_index].comments[comments.length-1] , style: TextStyle(backgroundColor: Colors.white , color: Color.fromRGBO(81, 200, 196, 1.0) , fontSize: 20,),),
        );

      }
*//*

      *//*Form(
          key: formKey,
          child: Row(
            children: <Widget>[
              TextFormField(

                style: TextStyle(
                  fontSize: 20.0,
                  height: 3.0,
                  color: Colors.white,
                  backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
                ),
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                  hintText: 'Please type in your comment here ',

                ),
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Comment can\'t be empty.';
                  }
                  return null;

                },
                onSaved: (val){
                  entries[pos].comments.add(val);
                  Row(
                    children: <Widget>[
                      SizedBox(width: queryData.size.width/20),
                      Container(
                        alignment: Alignment.center,
                        child:
                        Text(entries[pos].comments[entries[pos].comments.length-1].toString() , style: TextStyle(backgroundColor: Colors.white , color: Color.fromRGBO(81, 200, 196, 1.0) , fontSize: 20,),),
                      ),
                      SizedBox(width: queryData.size.width/20),

                    ],
                  );
                  //x++;
                },

              ),
              SizedBox(width: queryData.size.width/20),
              IconButton(
                  icon: Icon(Icons.send, size: 30, color: Color.fromRGBO(81, 200, 196, 1.0),),
                  onPressed: () {
                    if(formKey.currentState.validate()) {
                      formKey.currentState.save();
                      Navigator.pop(context);

                    }
                  }

              )

            ],
          )
      ),*//*
          ],

          //separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      );
*/

                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                SizedBox(width: queryData.size.width/25,
                                ),
                                Icon(Icons.chat, color: Color.fromRGBO(81, 200, 196, 1.0), size: 18),
                                SizedBox(width: queryData.size.width/40,),
                                Text("Comment", style: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0)),textAlign: TextAlign.center,),
                                SizedBox(width: queryData.size.width/15,
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                  ]),
              //makeCommentButton(),
              //makeShareButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget makeLike() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Color.fromRGBO(81, 200, 196, 1.0),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)
      ),
      child: Center(
        child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
      ),
    );
  }

  Widget makeLove() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)
      ),
      child: Center(
        child: Icon(Icons.favorite, size: 12, color: Colors.white),
      ),
    );
  }

}

class ForumDetailPage extends StatelessWidget {
  int current_index = 0;
  String post = 'How are you';
  final List<Widget> children = [];
  final _formKey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    String post_content = '';
    return new Scaffold(

      appBar: new AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        title: new Text(
          "Heal&Help",
          textScaleFactor: 1.3,
        ),
      ),
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

                                        entries.add(Posts(userName: username,
                                            userImage: 'lib/se/icons8-male-user-150.png',
                                            feedTime: '1 s ago',
                                            feedText: post_content,
                                            feedImage: '',
                                            likes: 0
                                        )

                                          //   Navigator.pushNamed(context, '/forum');
                                        );
                                        Navigator.pushNamed(context, '/forum');
                                        // Access data from database and find out the id of latest post made so far

                                        //await DatabaseService(uid : user.uid).updateUserPostData(, String user_id, String post, int likes, List comments );
                                        //updateUserPostData(, String user_id, String post, int likes, List comments );
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
                        /*Container(

                    padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.minimize),
                        iconSize: 100,
                        color: Color.fromRGBO(81, 200, 196, 1.0),
                        onPressed: () {
                          Navigator.pushNamed(context, '/forum');
                        },
                      )
                    ],
                              ),
                      ),*/
                        Row(
                          children: <Widget>[
                            Image(
                              image: AssetImage('lib/se/icons8-male-user-150.png'),
                              height: 50,

                            ),
                            SizedBox(width: queryData.size.width/20),
                            Text(
                              username,
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
                                      border: Border.all(color: Colors.blueAccent)
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
    return new Scaffold(

      appBar: new AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        title: new Text(
          "Heal&Help",
          textScaleFactor: 1.3,
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {

            return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    //direction: Axis.vertical,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Text("Comments" , style: TextStyle(backgroundColor: Colors.white , color: Color.fromRGBO(81, 200, 196, 1.0) , fontSize: 30, fontWeight: FontWeight.bold),),
                      ),
                      Container(

                        height: queryData.size.height,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            //here your code
                            //scrollDirection: Axis.vertical,
                            itemCount: length_of_comments,
                            itemBuilder: (BuildContext context, int index) {

                              return makeComments(entries[specific_post_id_whose_comment_is_made].comments[index]);


                            }
                        ),
                      ),

                    ],

                  ),
                )
            );
          }
      ),



    );
  }

  Widget makeComments(String comment )
  {
//    var queryData = MediaQuery.of(context);
    /*for(int i = 0 ; i < comments.length ; i++ )
     {
   */    return

    Container(
        margin: EdgeInsets.only(right: 20 ,left:20, bottom: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 2),
                  Container(
                    alignment: Alignment.center,
                    child:
                    Text(comment.toString() , style: TextStyle(backgroundColor: Colors.white , color: Color.fromRGBO(81, 200, 196, 1.0) , fontSize: 20,),),
                  ),
                  SizedBox(width: 2),

                ],
              ),
            ]
        ));


  }

}
