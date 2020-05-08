import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:settings/screens/change_password_successful.dart';

class ChangePassword3 extends StatefulWidget {
  @override
  _ChangePassword3State createState() => _ChangePassword3State();
}

class _ChangePassword3State extends State<ChangePassword3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          actionsIconTheme: IconThemeData(
              color: Colors.white),

          centerTitle: true,
          leading: Icon(Icons.arrow_back, color: Colors.white,),


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

                new Text(
                    'password successfully updated!',
                    textAlign: TextAlign.center,

                    style: new TextStyle(
                      fontSize: 30.0,
                      color: Theme.of(context).primaryColor,
                    )
                ),



                new FlatButton(onPressed: (){
                  Navigator.of(context).pushNamed('/forum');
                },
                    child: Text('back',
                        style: const TextStyle(
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
