import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:settings/screens/change_password_error.dart';

class ChangePassword2 extends StatefulWidget {
  @override
  _ChangePassword2State createState() => _ChangePassword2State();
}

class _ChangePassword2State extends State<ChangePassword2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'heal&help',
            style: TextStyle(
              fontSize: 25.0,
              //fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          elevation: 0.0,
        ),
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
                              'change password',
                              style: new TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              )
                          ),
                        ]
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
                new Text(
                  'incorrect password. please try again.',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "new password",
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
                new FlatButton(onPressed: (){},
                    child: Text('update',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    color: Theme.of(context).primaryColor,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                ),
              ]),
          elevation: 0.0,
        )
    );
  }
}
