import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutterapphealhelpversion1/signUpInformation.dart';
import 'auth.dart';
import 'signup.dart';
import 'package:flutterapphealhelpversion1/database.dart';
import 'package:provider/provider.dart';


String docID;
int counter = 0;
String userName = " ";

class LoginActual extends StatefulWidget {
  @override
  _LoginActualState createState() => _LoginActualState();
}

class _LoginActualState extends State<LoginActual> {
  Widget appBarTitle = new Text("Heal&Help");
  final formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String _email;
  String _password;
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final signUpInformation = Provider.of<QuerySnapshot>(context);
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                /*Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text('Heal&Help',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold)),
                    ),
*/                  Container(
                  padding: EdgeInsets.fromLTRB(12.0, 70.0, 0.0, 0.0),
                  child: Text('Login',
                      style: TextStyle(
                          fontSize: 70.0, fontWeight: FontWeight.bold , color: Color.fromRGBO(81, 200, 196, 1.0)) ),
                )
              ],
            ),
          ),
          Expanded(
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
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Username can\'t be empty.';
                          }
                          return null;

                        },
                        onSaved: (val) => _email = val,
                        obscureText: true,
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Password can\'t be empty.';
                          }
                          return null;

                        },
                        onSaved: (val) => _password = val,
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),

                      SizedBox(height: 40.0),
                      Text("Please enter valid credentials", style: TextStyle(color: enabled ? Color.fromRGBO(81, 200, 196, 1.0) : Colors.white  , fontSize: 15 , fontWeight: FontWeight.bold),),
                      SizedBox(height: 5.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Color.fromRGBO(81, 200, 196, 1.0),
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () async {
                              //print(_email);
                              //print(_password);
                              if(_formKey.currentState.validate()){
                                _formKey.currentState.save();

                                print(_email);
                                dynamic result = await _auth.signInWithEmailAndPassword(_email, _password);
                                //print(result.uid);
                                user = result;

                                print(_password);
                                if(result == null){
                                  setState(() {
                                    enabled = true;
                                  });


                                }else{

                                  //print(signUpInformation.documents.length);

                                    for ( var doc in signUpInformation.documents)
                                    {
                                      if(doc.data["email"] == _email && doc.data["password"] == _password)
                                        {
                                          docID = doc.documentID;
                                          //fit hai
                                          userName = doc.data["username"];
                                          setState(() {
                                            enabled = false;
                                          });

                                          Navigator.of(context).pushNamed('/forum');
                                        }
                                    };
                                  //Navigator.of(context).pushNamed('/forum');
                                }
                              }
                            },
                            child: Center(

                              child: Text(
                                'LOGIN',
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
                    ],
                  )
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(

                  'New to Heal&Help?',

                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 20,),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Color.fromRGBO(81, 200, 196, 1.0),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );


  }
}
