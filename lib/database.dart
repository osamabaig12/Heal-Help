import 'package:cloud_firestore/cloud_firestore.dart';
 class DatabaseService{

   final String uid;
   DatabaseService({this.uid});

   final CollectionReference postCollection = Firestore.instance.collection("posts");
   final CollectionReference signUpCollection = Firestore.instance.collection("signupInformation");
//   final CollectionReference chatCollection = Firestore.instance.collection("chats");
   Future addUserPostData(int post_id, String user_id, String username, String post, int likes, List comments, List commentinguser_ids ) async
   {
     return await postCollection.add({
       'post_id' : post_id,
       'user_id' : user_id,
       'user_name' : username,
       'post' : post,
       'likes' : likes,
       'comments' : comments,
       'commentinguser_ids' : commentinguser_ids,

     });
   }

   Future updateUserPostData(int post_id, String user_id, String username, String post, int likes, List comments ) async
   {
     return await postCollection.document(uid).setData({
       'post_id' : post_id,
       'user_id' : user_id,
       'user_name' : username,
       'post' : post,
       'likes' : likes,
       'comments' : comments

     });
   }

   //get posts stream
   Stream<QuerySnapshot> get posts{
     return postCollection.snapshots();
   }

   Future addUserInformation(String user_id , String username , String email, String password ) async
   {
     return await signUpCollection.add({
       'user_id' : user_id,
       'username' : username,
       'email' : email,
       'password' : password,

     });
   }

   //get posts stream
   Stream<QuerySnapshot> get signUpInformation{
     return signUpCollection.snapshots();
   }
 }
