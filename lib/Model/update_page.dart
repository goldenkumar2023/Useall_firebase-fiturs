import 'package:flutter/material.dart';
import '../home.dart';
import 'home_page.dart';
import 'user_model.dart';
// import 'firebase_service.dart';

class UpdatePage extends StatefulWidget {

  final Userdatamodel user;
  final FirebaseService firebaseService = FirebaseService();

  UpdatePage({required this.user});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    phoneController = TextEditingController(text: widget.user.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Page'),
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
                Userdatamodel updatedUser = Userdatamodel(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                );

                try {
                  // Update user data in Firestore
                  await widget.firebaseService.updateUserFromFirestore("${widget.user.users_id}", updatedUser);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('User updated successfully!'),
                  ));

                  // Navigate back to the home page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => home(user: updatedUser, users_id:  Userdatamodel())),
                  );
                } catch (e) {
                  print('Error updating user: $e');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Error updating user. Please try again.'),
                  ));
                }
              },
              child: Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}

