// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'home.dart';
//
// class Regester extends StatefulWidget {
//   const Regester({Key? key}) : super(key: key);
//
//   @override
//   State<Regester> createState() => _RegesterState();
// }
//
// class _RegesterState extends State<Regester> {
//   var auth = FirebaseAuth.instance;
//
//   TextEditingController name = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           children: [
//             TextField(
//               controller: name,
//               decoration: InputDecoration(hintText: "Enter name"),
//             ),
//             TextField(
//               controller: phone,
//               decoration: InputDecoration(hintText: "Enter phone"),
//             ),
//             TextField(
//               controller: email,
//               decoration: InputDecoration(hintText: "Enter email"),
//             ),
//             TextField(
//               controller: password,
//               decoration: InputDecoration(hintText: "Enter password"),
//             ),
//             SizedBox(height: 50),
//             ElevatedButton(
//               onPressed: () {
//                 register(email.text, password.text);
//               },
//               child: Text("Submit"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> register(String email, String password) async {
//     try {
//       await auth.createUserWithEmailAndPassword(email: email, password: password);
//
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Homepage()),
//
//       );
//     } catch (error) {
//       print(error);
//       Fluttertoast.showToast(msg: "invalid-email");
//     }
//   }
// }
