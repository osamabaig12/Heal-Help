import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapphealhelpversion1/login_actual.dart';
import 'change_username_default.dart';
import 'change_password_default.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}
final AuthService _auth = AuthService();
class _SettingsScreenState extends State<SettingsScreen> {
  int selectedIndex = 0;
  int _curIndex = 0;
  List<String> sets = ["change username","change password","delete account","log out"];

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
          title: new Text(
            "Heal&Help",
            textScaleFactor: 1.4,
          ),
        ),
        body: new Card(
          child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Container(
                    padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          new Text(
                              'Settings',
                              style: new TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(81, 200, 196, 1.0),
                              )
                          ),
                        ]
                    )
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SizedBox(
                    width: queryData.size.width/1.25,
                    child: new FlatButton(
                        onPressed: (){
                          Navigator.push
                            (context,
                            MaterialPageRoute(builder: (context) => ChangeUsername()),
                          );
                        },
                        child: Text('Change Username',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            )),
                        color: Color.fromRGBO(81, 200, 196, 1.0),
                        padding: EdgeInsets.all(10),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))

                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: SizedBox(
                    width: queryData.size.width/1.25,
                    child: new FlatButton(onPressed: () async {
                      FirebaseUser user = await FirebaseAuth.instance.currentUser();
                      user.delete();


                      Firestore.instance
                          .collection('signupInformation')
                          .document(docID).delete();

                      Navigator.of(context).pushNamed('/login');

                    },
                        child: Text('Delete Account',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            )),
                        color: Color.fromRGBO(81, 200, 196, 1.0),
                        padding: EdgeInsets.all(10),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: SizedBox(
                    width: queryData.size.width/1.25,
                    child: new FlatButton(onPressed: () async {
                      await _auth.signOut();
                      Navigator.of(context).pushNamed('/login');

                    },
                        child: Text('Log Out',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            )),
                        color: Color.fromRGBO(81, 200, 196, 1.0),
                        padding: EdgeInsets.all(10),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))

                    ),
                  ),
                ),
              ]
          ),
          elevation: 0.0,
        ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        //backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
        items:
        [
          BottomNavigationBarItem(
            icon: new Icon(Icons.spa,color: Colors.white,size: 50,),
            title: Text(' '),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.local_florist,color: Colors.white,size: 50,),
            title: Text(' '),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.local_drink,color: Colors.white,size: 50,),
            title: Text(' '),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home,color: Colors.white,size: 50,),
            title: Text(' '),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.message,color: Colors.white,size: 50,),
            title: Text(' ',),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings,color: Colors.white,size: 50,),
            title: Text(' '),
          ),
        ],
        currentIndex: _curIndex,
        onTap: (index) {
          setState(() {
            _curIndex = index;
            switch (_curIndex) {
              case 0:
                Navigator.of(context).pushNamed('/inhale');
                break;
              case 1:
                Navigator.of(context).pushNamed('/period');
                break;
              case 2:
                Navigator.of(context).pushNamed('/trackers');
                break;
              case 3:
                Navigator.of(context).pushNamed('/forum');
                break;
              case 4:
                Navigator.of(context).pushNamed('/chat');
                break;
              case 5:
                Navigator.of(context).pushNamed('/settings');
                break;

            }
          });
        },
      ),
    );
  }
}
