import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'change_username_actual.dart';
import 'package:flutterapphealhelpversion1/database.dart';
import 'package:provider/provider.dart';
import 'login_actual.dart';


class DeleteAccount extends StatefulWidget {
  @override
  _DeleteAccountState createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {

  @override
  Widget build(BuildContext context) {

    final signups = Provider.of<QuerySnapshot>(context);
    print("JHGJHG");
    for ( int i = 0 ; i < signups.documents.length ; i++ )
    {
      print(signups.documents[i].data["email"]);

      if(signups.documents[i].data["username"] == userName)
      { print("HEREREE");
      String docID = signups.documents[i].documentID;

      Firestore.instance
          .collection('signupInformation')
          .document(docID).delete();
      //userName = val;
      //Navigator.pushNamed(context, '/username_accessful');
      break;
      }

    }

    return Container();
  }
}
