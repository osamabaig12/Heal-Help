import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutterapphealhelpversion1/signUpInformation.dart';
import 'auth.dart';
import 'login.dart';
import 'database.dart';
import 'package:provider/provider.dart';
import 'login_actual.dart';
import 'forum_first.dart';

class CommentsActual extends StatefulWidget {
  @override
  _CommentsActualState createState() => _CommentsActualState();
}

class _CommentsActualState extends State<CommentsActual> {
  final _formKey = GlobalKey<FormState>();
  var comment_body = ' ';
  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    final posts = Provider.of<QuerySnapshot>(context);
    return Scaffold(
      body:LayoutBuilder(
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
                      SizedBox(height: 20,),
                      Container(

                        height: queryData.size.height/2,
                        decoration: BoxDecoration(
                       //   border: Border.all(color: Color.fromRGBO(81, 200, 196, 1.0),width: 2,),
                        ),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
//here your code
//scrollDirection: Axis.vertical,
                            itemCount: posts.documents[specific_post_id_whose_comment_is_made].data["comments"].length,
                            itemBuilder: (BuildContext context, int index) {
                              /* StreamProvider<QuerySnapshot>.value(value: DatabaseService().posts);
                              final posts = Provider.of<QuerySnapshot>(context, listen: false);

                             */

                              print("Inside list view");
                              if (posts.documents[specific_post_id_whose_comment_is_made]
                                  .data["comments"].length != 0) {
                                return makeComments(posts.documents[specific_post_id_whose_comment_is_made].data["comments"][index]);
                              }
                            }
                        ),

                      ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(


                        decoration: InputDecoration(
                            labelText: 'Comment',
                            contentPadding: EdgeInsets.all(10),
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Comment can\'t be empty.';
                          }
                          return null;

                        },
                        onSaved: (val) {
                          comment_body = val;
                          print("onsaved before");
                          print(val);
                          List comments_temp = posts.documents[specific_post_id_whose_comment_is_made].data["comments"];
                          comments_temp.add(val);

                          List user_ids_commenting_temp = posts.documents[specific_post_id_whose_comment_is_made].data["commentinguser_ids"];
                          user_ids_commenting_temp.add(user.uid);
                          Firestore.instance
                              .collection('posts')
                              .document(posts.documents[specific_post_id_whose_comment_is_made].documentID)
                              .updateData({
                            'comments' : comments_temp,
                            'commentinguser_ids' : user_ids_commenting_temp,
                          });
                          print("onsaved after");
                        }
//                        obscureText: true,
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        width:queryData.size.width/2,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Color.fromRGBO(81, 200, 196, 1.0),
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: ()  {
                              //print(_email);
                              //print(_password);
                              if(_formKey.currentState.validate()){
                                _formKey.currentState.save();
                                print("AAO wahaaan");


                              }
                            },
                            child: Center(

                              child: Text(
                                'Post',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),
                        ]))
                    ],

                  ),
                )
            );
          }
      ),
    );
  }

  Widget makeComments(String comment )
  {  final posts = Provider.of<QuerySnapshot>(context);
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
                  SizedBox(width: 1),
                  Text(userName + ": " , style: TextStyle( color: Color.fromRGBO(81, 200, 196, 1.0) , fontSize: 18,),),
                  SizedBox(width: 3 ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromRGBO(81, 200, 196, 1.0),width: 10,),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color.fromRGBO(81, 200, 196, 1.0),


                      ),
                      child:
                      Text(comment.toString() , style: TextStyle( color: Colors.white , fontSize: 20,),),
                    ),
                  ),
                  SizedBox(width: 2),
                  IconButton(
                    icon: Icon(Icons.delete,color: Colors.white,size: 50,),
                    onPressed: (){
                      List comments_temp = posts.documents[specific_post_id_whose_comment_is_made].data["comments"];
                      List user_ids_commemted_temp = posts.documents[specific_post_id_whose_comment_is_made].data["commentinguser_ids"];

                      for(int i = 0 ; i < posts.documents[specific_post_id_whose_comment_is_made].data["comments"].length ; i++)
                        {
                          if(comment == posts.documents[specific_post_id_whose_comment_is_made].data["comments"][i] && user.uid == posts.documents[specific_post_id_whose_comment_is_made].data["commentinguser_ids"][i] )
                            {
                              comments_temp.removeAt(i);
                              user_ids_commemted_temp.removeAt(i);
                            }
                        }

                      Firestore.instance
                          .collection('posts')
                          .document(posts.documents[specific_post_id_whose_comment_is_made].documentID)
                          .updateData({
                        'comments' : comments_temp,
                        'commentinguser_ids' : user_ids_commemted_temp,
                      });
                    },
                  )


                ],
              ),
            ]
        ));


  }

}


