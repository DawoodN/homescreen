import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:homescreen/screens/home_screen.dart';
import 'package:homescreen/services/database.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return auth.currentUser;
  }

  Future<void> signInGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount == null) {
      // User canceled the sign-in
      return;
    }

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    UserCredential result = await auth.signInWithCredential(credential);
    User? userDetails = result.user;

    if (userDetails != null) {
      Map<String, dynamic> userInfoMap = {
        "email": userDetails.email,
        "name": userDetails.displayName,
        "imgurUrl": userDetails.photoURL,
        "id": userDetails.uid,
      };

      await DatabaseMethods().addUser(userDetails.uid, userInfoMap).then((value){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage(title: 'UniMeet')));
      });
      // Use the userInfoMap as needed
    }
  }
}
