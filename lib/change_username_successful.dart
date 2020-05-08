import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:settings/screens/change_username_successful.dart';

class ChangeUsername3 extends StatefulWidget {
  @override
  _ChangeUsername3State createState() => _ChangeUsername3State();
}

class _ChangeUsername3State extends State<ChangeUsername3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
          title: new Text(
            "Heal&Help",
            textScaleFactor: 1.3,
          ),
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

                new Text(
                    'username successfully updated!',
                    textAlign: TextAlign.center,

                    style: new TextStyle(
                      fontSize: 30.0,
                      color: Color.fromRGBO(81, 200, 196, 1.0),
                    )
                ),


                SizedBox(height: 20,),
                new FlatButton(onPressed: (){
                  Navigator.of(context).pushNamed('/forum');
                },


                    child: Text('back',
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
