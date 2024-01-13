import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../phoneauth_test/home_screen.dart';

class Googlelogin extends StatefulWidget {
  const Googlelogin({Key? key}) : super(key: key);

  @override
  State<Googlelogin> createState() => _GoogleloginState();
}

class _GoogleloginState extends State<Googlelogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: googlelogin,
            child: Text("googleSignin"),
          ),
        ),
      ),
    );
  }

  Future<void> googlelogin() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleAuth =
        await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

        Fluttertoast.showToast(msg: "Login successfully");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => homescreen()),
        );
      } else {
        Fluttertoast.showToast(msg: "Google Sign In canceled");
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "$error");
    }
  }
}

