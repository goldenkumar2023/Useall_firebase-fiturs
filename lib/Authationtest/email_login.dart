import 'package:firebase_auth/firebase_auth.dart';
import 'package:flipcart/Authationtest/regester.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../regesterpage.dart';
import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Enter email",
              ),
            ),
            TextField(
              controller: pass,
              decoration: InputDecoration(
                hintText: "Enter password",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                await loginWithEmail(email.text, pass.text);
              },
              child: Text("Login"),
            ),
            SizedBox(
              height: 26,
              width: 160,
            ),
            Row(
              children: [
                Text("SIGNup?"),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: Text(
                    "new user",
                    style: TextStyle(color: Colors.orange),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> loginWithEmail(String email, String pass) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen()));
    } catch (error) {
      // Handle errors gracefully
      print("Error during login: $error");

    }
  }
}
