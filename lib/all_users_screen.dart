import 'dart:async';
import 'chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllUsersScreen extends StatefulWidget {
  _AllUsersScreenState createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  int _curIndex = 0;
  StreamSubscription<QuerySnapshot> _subscription;
  List<DocumentSnapshot> usersList;
  final CollectionReference _collectionReference =
      Firestore.instance.collection("signupInformation");

  @override
  void initState() {
    super.initState();
    _subscription = _collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        usersList = datasnapshot.documents;
        print("Users List ${usersList.length}");
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
          title: new Text(
            "Messenger",
            textScaleFactor: 1.3,
          ),
        ),
        body: usersList != null
            ? Container(
                child: ListView.builder(
                  itemCount: usersList.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
                      ),
                      title: Text(usersList[index].data['username'],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),


                      onTap: (() {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                    name: usersList[index].data['username'],
                                    //photoUrl: usersList[index].data['photoUrl'],
                                    receiverUid:
                                        usersList[index].data['user_id'])));
                      }),
                    );
                  }),
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(81, 200, 196, 1.0),
                ),
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
