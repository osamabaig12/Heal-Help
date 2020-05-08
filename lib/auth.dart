import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapphealhelpversion1/database.dart';
FirebaseUser user;
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in with email and password


  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      user = result.user;
     await DatabaseService(uid: user.uid);
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //sign up with email and password

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid);
      return user;
    }
    catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //sign out

}