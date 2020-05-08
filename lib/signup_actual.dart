import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'login.dart';
import 'auth.dart';
import 'package:flutterapphealhelpversion1/database.dart';
import 'package:provider/provider.dart';

class SignUpActual extends StatefulWidget {
  @override
  _SignUpActualState createState() => _SignUpActualState();
}

class _SignUpActualState extends State<SignUpActual> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String username = ' ';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    //final posts = Provider.of<QuerySnapshot>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                  child: Text('SignUp', style: TextStyle(
                      fontSize: 70.0, fontWeight: FontWeight.bold , color: Color.fromRGBO(81, 200, 196, 1.0)) ),

                ),

              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email can\'t be empty.';
                          }
                          return null;


                        },
                        onSaved: (val) => email = val,

                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can\'t be empty.';
                          }
                          return null;


                        },
                        onSaved: (val) => password = val,
                        obscureText: true,
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'USER NAME ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Username can\'t be empty.';
                          }
                          return null;

                        },

                        onSaved: (val) => username = val,
                        obscureText: true,
                      ),
                      SizedBox(height: 50.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Color.fromRGBO(81, 200, 196, 1.0),
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () async {

                                if(_formKey.currentState.validate()){
                                  _formKey.currentState.save();

                                  //await DatabaseService(uid: user.uid);
                                  dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                  user = result;
                                  await DatabaseService(uid: result.uid);

                                  if (result == null){

                                  }
                                  else{
                                    await DatabaseService(uid : result.uid).addUserInformation(result.uid , username , email, password );
                                    Navigator.of(context).pushNamed('/login');
                                  }
                                }

                              },
                              child: Center(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),

                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        /*child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child:

                                Center(
                                  child: Text('Go Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ),


                              ),
                            ),*/
                      ),
                    ],
                  ),
                )),
          ),
          // SizedBox(height: 15.0),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //       'New to Spotify?',
          //       style: TextStyle(
          //         fontFamily: 'Montserrat',
          //       ),
          //     ),
          //     SizedBox(width: 5.0),
          //     InkWell(
          //       child: Text('Register',
          //           style: TextStyle(
          //               color: Colors.green,
          //               fontFamily: 'Montserrat',
          //               fontWeight: FontWeight.bold,
          //               decoration: TextDecoration.underline)),
          //     )
          //   ],
          // )
        ]),
      ),
    );
  }
}
