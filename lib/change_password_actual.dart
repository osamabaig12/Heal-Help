import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'change_username_actual.dart';
import 'package:flutterapphealhelpversion1/database.dart';
import 'package:provider/provider.dart';
import 'login_actual.dart';


class ChangePasswordActual extends StatefulWidget {
  @override
  _ChangePasswordActualState createState() => _ChangePasswordActualState();
}

class _ChangePasswordActualState extends State<ChangePasswordActual> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final signups = Provider.of<QuerySnapshot>(context);
    return Scaffold(
      body: new Card(
        child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Container(
                  padding: new EdgeInsets.only(top: 37.0, bottom: 27.0),
                  child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        new Text(
                            'Change password',
                            style: new TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(81, 200, 196, 1.0),
                            )
                        ),
                      ]
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "current password",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                      ),
                    ),
                  ),
                  validator: (val) {
                    if(val.length==0) {
                      return "password cannot be empty";
                    }else{
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text ,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Form(
                //padding: const EdgeInsets.all(10.0),
                key : _formKey,
                child: new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "new password",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  obscureText: true,
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
                        'password' : val,
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

              new FlatButton(onPressed: (){
                if(_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                }
              },
                  child: Text('Update',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  color: Color.fromRGBO(81, 200, 196, 1.0),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              ),
            ]),
        elevation: 0.0,
      )
    );
  }
}
