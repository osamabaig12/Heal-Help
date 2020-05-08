import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapphealhelpversion1/login_actual.dart';
//import 'package:flutterapphealhelpversion1/signUpInformation.dart';
import 'auth.dart';
import 'signup.dart';
import 'package:flutterapphealhelpversion1/database.dart';
import 'package:provider/provider.dart';
import 'login_actual.dart';
import 'dart:io';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/signup': (BuildContext context) => new SignupPage()
        },
        home: new MyHomePage(),

    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  //FormType _formType = FormType.login;
  //String _authHint = '';

  /*bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  */@override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Widget appBarTitle = new Text("Heal&Help");
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
      value:DatabaseService().signUpInformation,
      child: new Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: new AppBar
              (
              title: appBarTitle,
              centerTitle: true,
              backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
            ),
            body: LoginActual(),
      ),
    ), );
  }
}
