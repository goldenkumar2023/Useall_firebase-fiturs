// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flipcart/regesterpage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'home.dart';
//
// class login extends StatefulWidget {
//   const login({super.key});
//
//   @override
//   State<login> createState() => _loginState();
// }
//
// class _loginState extends State<login> {
//   TextEditingController email = TextEditingController();
//   TextEditingController pass = TextEditingController();
//
//   var auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           children: [
//             TextField(
//               controller: email,
//               decoration: InputDecoration(hintText: "enteremail"),
//             ),
//             TextField(
//               controller: pass,
//               decoration: InputDecoration(hintText: "enterpass"),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   login(email.text, pass.text);
//                 },
//                 child: Text("login")),
//             SizedBox(
//               height: 26,
//               width: 160,
//             ),
//             Row(
//               children: [
//                 Text("News User?"),
//                 InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Regester(),
//                           ));
//                     },
//                     child: Text(
//                       'SignUp',
//                       style: TextStyle(fontSize: 20, color: Colors.green),
//                     )),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> login(String email, String pass) async {
//     try {
//       auth
//           .signInWithEmailAndPassword(email: email, password: pass)
//           .then((value) {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Homepage(),
//             ));
//       }).onError((error, stackTrace) {
//         print(error);
//       });
//     } catch (error) {
//       print(error);
//     }
//   }
// }

