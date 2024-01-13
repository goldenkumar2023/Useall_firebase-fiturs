// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'enterotp.dart';
//
// class Phonenumber extends StatefulWidget {
//   const Phonenumber({super.key});
//
//   @override
//   State<Phonenumber> createState() => _PhonenumberState();
// }
//
// class _PhonenumberState extends State<Phonenumber> {
//   TextEditingController phoneController=TextEditingController();
//   var auth=FirebaseAuth.instance;
//   String verify="";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//    body: ListView(
//      children: [
//        TextField(
//          keyboardType: TextInputType.phone,
//          controller: phoneController,
//          decoration: InputDecoration(
//            hintText: "Enternumber"
//          ),
//
//        ),
//
//         SizedBox(
//           height: 50,
//         ),
//        ElevatedButton(
//          onPressed: () {
//             auth.verifyPhoneNumber(
//              phoneNumber: "+91${phoneController.text}",
//              verificationCompleted: (phoneAuthCredential) {
//            },
//                verificationFailed: (error) {
//                  print(error);
//                },
//                codeSent: (verificationId, forceResendingToken) {
//                  verify = verificationId;
//                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyOtp( verifycation: verify,),));
//                },
//                codeAutoRetrievalTimeout: (verificationId) {
//
//                },);
//          },
//          child: Text("send"),
//        )
//
//      ],
//    ),
//     );
//   }
// }
