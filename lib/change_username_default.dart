import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'change_username_actual.dart';
import 'package:flutterapphealhelpversion1/database.dart';
import 'package:provider/provider.dart';
//import 'package:settings/screens/change_username_default.dart';

class ChangeUsername extends StatefulWidget {
  @override
  _ChangeUsernameState createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value:DatabaseService().signUpInformation,
      child: Scaffold(
          backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
          appBar: new AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
            title: new Text(
              "Heal&Help",
              textScaleFactor: 1.3,
            ),
          ),
          body: ChangeUserNameActual(),
      ),
    );

  }
}
