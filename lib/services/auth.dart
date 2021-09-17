import 'package:firebase_auth/firebase_auth.dart';
import 'package:interactive_chart/models/user.dart';
import 'package:interactive_chart/services/database.dart';

class AuthService {
  // create instance
  final FirebaseAuth _auth = FirebaseAuth.instance; // _ means private

  //create user object based on firebaseUser
  Usercc? _userFromFirebaseUser(User? user){
    return user != null ? Usercc(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Usercc?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
  }
  // method to sign in anon.
  Future sign_in_anon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // method to sign in with email and pass
  Future signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // method to register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email:
                              email, password: password);
      User? user = result.user;
      // create a new document for the user with the uid


      await DatabaseService(uid: user!.uid).updateUserData('napoleon', 'shrimp_cocktail', 'steak');

      return _userFromFirebaseUser(user);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }


  // method to sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;

    }
  }

}