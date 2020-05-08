import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapphealhelpversion1/signup_actual.dart';
import 'login.dart';
import 'auth.dart';
import 'package:flutterapphealhelpversion1/database.dart';
import 'package:provider/provider.dart';
class SignupPage extends StatefulWidget {
  final Function toggleView;
  SignupPage({this.toggleView});
  @override
  _SignupPageState createState() => _SignupPageState();
}
String username = '';
class _SignupPageState extends State<SignupPage> {

  Widget appBarTitle = new Text("Heal&Help");
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().signUpInformation,
      child: new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: new AppBar
            (
              title: appBarTitle,
              centerTitle: true,
              backgroundColor: Color.fromRGBO(81, 200, 196, 1.0)
          ),
          body: SignUpActual(),
      ),
    );
  }
}