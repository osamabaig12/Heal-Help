import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'change_password_actual.dart';
import 'package:flutterapphealhelpversion1/database.dart';
import 'package:provider/provider.dart';
//import 'package:settings/screens/change_password_default.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  @override
  Widget build(BuildContext context) {

    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().signUpInformation,
      child: Scaffold(
          backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
          appBar: AppBar(

            centerTitle: true,
            //leading: Icon(Icons.arrow_back, color: Colors.white,),

            title: Text(
              'Heal&Help',
              style: TextStyle(
                fontSize: 25.0,
                //fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            elevation: 0.0,
          ),
          body: ChangePasswordActual(),
      ),
    );
  }
}
