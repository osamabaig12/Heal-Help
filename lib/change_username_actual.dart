import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapphealhelpversion1/login_actual.dart';
//import 'package:flutterapphealhelpversion1/signUpInformation.dart';
import 'auth.dart';
import 'login.dart';
import 'package:flutterapphealhelpversion1/database.dart';
import 'package:provider/provider.dart';
import 'login_actual.dart';

class ChangeUserNameActual extends StatefulWidget {
  @override
  _ChangeUserNameActualState createState() => _ChangeUserNameActualState();
}

class _ChangeUserNameActualState extends State<ChangeUserNameActual> {
  final _formKey = GlobalKey<FormState>();
  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    final signups = Provider.of<QuerySnapshot>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Card(
        child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Container(
                  padding: new EdgeInsets.only(top: 70.0, bottom: 50.0),
                  child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        new Text(
                            'Change Username',
                            style: new TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(81, 200, 196, 1.0),
                            )

                        ),

                      ]

                  )

              ),
              Form(
                //padding: const EdgeInsets.all(10.0),
                key : _formKey,

                child: new TextFormField(

                  decoration: new InputDecoration(
                    labelText: "new username",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                      ),

                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if(val.length==0) {
                      return "username cannot be empty";
                    }else{
                      return null;
                    }
                  },
                  onSaved: (val)
                  {
                    //Meed to find document with the specific user ID

                    for ( int i = 0 ; i < signups.documents.length ; i++ )
                    {
                      print(signups.documents[i].data["email"]);

                    if(signups.documents[i].data["username"] == userName)
                    { print("HEREREE");
                    String docID = signups.documents[i].documentID;

                    Firestore.instance
                        .collection('signupInformation')
                        .document(docID)
                        .updateData({
                      'username' : val,
                    });
                    userName = val;
                    Navigator.pushNamed(context, '/username_accessful');
                    break;
                    }

                    }


                    

                  },
                  keyboardType: TextInputType.text ,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),

              SizedBox(height:10,),
              new FlatButton(onPressed: (){
      if(_formKey.currentState.validate()) {
        _formKey.currentState.save();
        }
      },

                  child: Text('update',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),

                  color: Color.fromRGBO(81, 200, 196, 1.0),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))

              ),
            ]),
        elevation: 0.0,

      ),

    );

  }
}
