import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutterapphealhelpversion1/signUpInformation.dart';
import 'auth.dart';
import 'login.dart';
import 'package:flutterapphealhelpversion1/database.dart';
import 'package:provider/provider.dart';
import 'forum_first.dart';
class ForumActual extends StatefulWidget {
  @override
  _ForumActualState createState() => _ForumActualState();
}

class _ForumActualState extends State<ForumActual> {
  //final DBRef = FirebaseDatabase.instance.reference();

  String result = '';
  int _curIndex = 0;
  var enabled = false;
  final formKey = GlobalKey<FormState>();
  final List<int> colorCodes = <int>[600, 500, 100, 200];
  //bool enabled = false;
  @override
  Widget build(BuildContext context) {


    //StreamProvider<QuerySnapshot>.value(value: DatabaseService().posts);
    var queryData = MediaQuery.of(context);
    final posts = Provider.of<QuerySnapshot>(context);

    return new Scaffold(
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
                    hintStyle: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0),fontSize: 20,fontWeight: FontWeight.bold, ),
                    hintText: "Hello! Hope you're doing great today!",

                  ),
                )
            ),
            Container(
              height: 100,
              width: queryData.size.width/1.55,
              padding: EdgeInsets.only(top: 0, right: 20, left: 10, bottom: 50),
              child: Row(
                children: <Widget>[
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
                          //print("WHATS");
                          result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForumDetailPage()),
                          );
                          //Navigator.of(context).pushNamed('/forumpost');

                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0),fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                          hintText: "What's on your mind?",
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
                      itemCount: posts.documents.length,//calculate_length_of_posts_in_database(),
                      itemBuilder: (BuildContext context, int index) {

                        //final posts = Provider.of<QuerySnapshot>(context, listen: false);

                        //print(posts.documents.length);
                        //int j = posts.documents[index].data["likes"];
                        //print(j);
                        return makeFeed(
                          userName: posts.documents[index].data["user_name"],
                          userImage : (entries[0].userImage),
                          feedImage: " ",
                          feedTime: (entries[0].feedTime).toString(),
                          feedText: posts.documents[index].data["post"].toString(),
                          no_of_likes:  posts.documents[index].data["likes"],
                          document_id: posts.documents[index].documentID,
                          index_of_post : index,
                        );

                          /*userName: (entries[index].userName).toString(),
                                        userImage : (entries[index].userImage),
                                        feedTime: (entries[index].feedTime).toString(),
                                        feedText: (entries[index].feedText).toString(),
                                        feedImage : (entries[index].feedImage).toString(),
                                        likes:  (entries[index].likes).toString(),
                                        index_of_post : index,*//*

                        );*//*Container(
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
            title: Text(' '),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.local_florist,color: Colors.white,size: 50,),
            title: Text(' '),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.local_drink,color: Colors.white,size: 50,),
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
                Navigator.of(context).pushNamed('/period');
                break;
              case 2:
                Navigator.of(context).pushNamed('/trackers');
                break;
              case 3:
                Navigator.of(context).pushNamed('/forum');
                break;
              case 4:
                Navigator.of(context).pushNamed('/chat');
                break;
              case 5:
                Navigator.of(context).pushNamed('/settings');
                break;

            }
          });
        },
      ),
    );

  }
  int calculate_length_of_posts_in_database()
  {
    //StreamProvider<QuerySnapshot>.value(value: DatabaseService().posts);
    final posts = Provider.of<QuerySnapshot>(context);
    return posts.documents.length;

  }
  void updateEnabled()
  {
    setState(() {
      if(enabled == true)
      { enabled = false; }
      else if (enabled == false)
        {
          enabled = true;
        }
    });
  }
  Widget makeFeed({userName, userImage, feedTime, feedText, feedImage, no_of_likes,document_id , index_of_post}) {

    var queryData = MediaQuery.of(context);

    final posts = Provider.of<QuerySnapshot>(context);
    int no_of_comments = posts.documents[index_of_post].data["comments"].length;
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

                      Text(userName
                       , style: TextStyle(color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),),
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
                      title: Text('Report/Delete Post?', style: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0), fontWeight: FontWeight.bold, fontSize: 30),),
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
                        ),
                        MaterialButton(
                          elevation: 5.0,
                          color: Color.fromRGBO(81, 200, 196, 1.0),
                          height: 30.0,
                          minWidth: 30.0,
                          child: Text("Delete", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                          onPressed: (){
                            Firestore.instance
                                .collection('posts')
                                .document(document_id)
                                .delete();
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
          /*feedImage != '' ?
          Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(feedImage),
                    fit: BoxFit.cover
                )
            ),
          ) : Container(),*/
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

                  Text('$no_of_likes', style: TextStyle(fontSize: 15, color: Colors.grey[800]),)
                ],
              ),
              Text("$no_of_comments Comments", style: TextStyle(fontSize: 13, color: Colors.grey[800]),)
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
                          color: ( enabled
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
                                Icon(Icons.thumb_up, color: enabled
                                    ? Colors.white : Color.fromRGBO(81, 200, 196, 1.0), size: 18),
                                SizedBox(width: queryData.size.width/40,),
                                //Text("Like", style: TextStyle(color: Color.fromRGBO(81, 200, 196, 1.0)),textAlign: TextAlign.center,),
                                Text("Like", style: TextStyle(color: enabled
                                    ? Colors.white : Color.fromRGBO(81, 200, 196, 1.0) ,),textAlign: TextAlign.center, ),

                                SizedBox(width: queryData.size.width/9,
                                ),
                              ],
                            ),
                          ),
                          onTap:  () async  {
                            //StreamProvider<QuerySnapshot>.value(value: DatabaseService().posts);


                            //print("here");
                      //      await DatabaseService(uid : user.uid).updateUserPostData( 0, user.uid, username, feedText, no_of_likes, posts.documents[index_of_post].data["comments"]);

                              //need to adjust like feature here
                            if(enabled == true){
                              print("enabled true");
                              no_of_likes--;

                              print(no_of_likes);
                              Firestore.instance
                                  .collection('posts')
                                  .document(document_id)
                                  .updateData({
                                'likes': no_of_likes
                              });
                              //await DatabaseService(uid : user.uid).updateUserPostData( index_of_post, user.uid, username, feedText, no_of_likes, posts.documents[index_of_post].data["comments"]);
                           //await DatabaseService(uid : user.uid).updateUserPostData( index_of_post, user.uid, username, feedText, no_of_likes, posts.documents[index_of_post].data["comments"]);
                              no_of_likes++;
//                              enabled = false;
                            }
                            else {
                              print("enabled false");
                              no_of_likes++;
                              //likes = y.toString();
                              //            print(likes);
                              Firestore.instance
                                  .collection('posts')
                                  .document(document_id)
                                  .updateData({
                                'likes': no_of_likes
                              });

                              //      await DatabaseService(uid : user.uid).updateUserPostData( index_of_post, user.uid, username, feedText, no_of_likes, posts.documents[index_of_post].data["comments"]);
                              print(no_of_likes);
                              no_of_likes--;

  //                            enabled = true;
                            }


                            setState(() {
                              if(enabled == true){
                                print("enabled true");
                                no_of_likes--;
                                //likes = y.toString();
                                //            print(likes);
                                updateEnabled();
                                print(enabled);
                                print(no_of_likes);
//                                await DatabaseService(uid : user.uid).updateUserPostData( 0, user.uid, username, feedText, no_of_likes, posts.documents[index_of_post].data["comments"]);

                              }
                              else {
                                print("enabled false");
                                no_of_likes++;
                                //likes = y.toString();
                                //            print(likes);
  //                              await DatabaseService(uid : user.uid).updateUserPostData( 0, user.uid, username, feedText, no_of_likes, posts.documents[index_of_post].data["comments"]);
                                updateEnabled();
                                print(no_of_likes);


                                //enabled = true;
                                print(enabled);
                              }

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
                            //StreamProvider<QuerySnapshot>.value(value: DatabaseService().posts);
                            //final posts = Provider.of<QuerySnapshot>(context, listen: false);

                            //here a for loop will come which will check that comment button for whic post has been clickd
                            // How to check the post id
                            setState (()  {

                              length_of_comments = posts.documents[index_of_post].data["comments"].length;
                              specific_post_id_whose_comment_is_made = index_of_post;

                              //length_of_comments = entries[index_of_post].comments.length;
                              //specific_post_id_whose_comment_is_made = index_of_post;


                            }  );

                            result = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CommentsScreen())

                            );
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

