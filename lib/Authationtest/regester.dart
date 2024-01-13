import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: "Enter email"),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: "Enter password"),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
                register(email.text, password.text);
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> register(String email, String password) async {
    try {
      UserCredential userCredential =
      await auth.createUserWithEmailAndPassword(email: email, password: password);


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen()));
    } catch (error) {
      // Handle errors gracefully
      print("Error during registration: $error");

    }
  }
}
