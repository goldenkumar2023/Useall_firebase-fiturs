// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../home.dart';
//
// class VerifyOtp extends StatefulWidget {
//   String verifycation;
//    VerifyOtp( {super.key,required this.verifycation});
//
//   @override
//   State<VerifyOtp> createState() => _VerifyOtpState();
// }
//
// class _VerifyOtpState extends State<VerifyOtp> {
//   TextEditingController PhoneOtp = TextEditingController();
//   var auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Column(
//         children: [
//           SizedBox(height: 80,),
//            TextField(
//             controller: PhoneOtp,
//             decoration: InputDecoration(
//               hintText: "enter otp"
//             ),
//           ),
//
//           ElevatedButton(onPressed: (){
//             PhoneAuthCredential credential = PhoneAuthProvider.credential(
//                 verificationId: widget.verifycation,
//                 smsCode: PhoneOtp.text);
//             auth.signInWithCredential(credential);
//             //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homepage(),));
//     },
//     child: Text("send")),
//         ],
//       ),
//     );
//   }
// }

