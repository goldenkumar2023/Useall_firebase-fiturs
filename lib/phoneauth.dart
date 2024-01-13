import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhoneAuthScreen(),
    );
  }
}
class PhoneAuthScreen extends StatefulWidget {


  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}
class _PhoneAuthScreenState extends State<PhoneAuthScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();

  void _signInWithPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-retrieval of verification code completed.
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: $e');
        },
        codeSent: (String verificationId, int? resendToken) {
          // Save the verification ID to use later
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-retrieval of verification code timed out
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      print('Error during phone number verification: $e');
    }
  }

  void _verifyWithCode(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      print('Phone authentication successful!');
    } catch (e) {
      print('Error during code verification: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneNumber ,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Enter your phone number'),
              onChanged: (value) {
                // Handle phone number input
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Call the function to initiate phone authentication
                _signInWithPhoneNumber('+91${phoneNumber.text}'); // Replace with the desired phone number
              },
              child: Text('Send Verification Code'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: otp,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter the code'),
              onChanged: (value) {
                // Handle verification code input
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Call the function to verify the code
                _verifyWithCode('${otp.text}'); // Replace with the received verification code
              },
              child: Text('Verify Code'),
            ),
          ],
        ),
      ),
    );
  }
}
