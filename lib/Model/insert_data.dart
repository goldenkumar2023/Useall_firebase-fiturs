import 'package:flutter/material.dart';
import 'user_model.dart';
// import 'firebase_service.dart';
import 'home_page.dart';

class InsertPage extends StatefulWidget {
  @override
  _InsertPageState createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final FirebaseService firebaseService = FirebaseService();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Insert User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_validateInputs()) {
                  Userdatamodel newUser = Userdatamodel(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                  );

                  // Insert user data
                  await _insertUser(newUser);

                  // Navigate to the home page after inserting user
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => home(user: newUser, users_id: Userdatamodel(),)),
                  );
                } else {
                  _showSnackBar('Please fill in all fields.');
                }
              },
              child: Text('Insert User'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _insertUser(Userdatamodel user) async {
    try {
      await firebaseService.insertUserFromFirestore(user.users_id.toString(),user.toJson());
      _showSnackBar('User inserted successfully!');
    } catch (e) {
      print('Error inserting user: $e'); // Log the error for debugging
      _showSnackBar('Error inserting user. Please try again.');
    }
  }

  bool _validateInputs() {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty;
  }

  // Make _showSnackBar an asynchronous operation
  Future<void> _showSnackBar(String message) async {
    await SnackBar(
      content: Text(message),
    );
  }
}


