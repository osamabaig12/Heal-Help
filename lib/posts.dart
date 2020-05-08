import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<QuerySnapshot>(context);
    for ( var doc in posts.documents)
      {
        print(doc.data['post']);
      }
  }
}
