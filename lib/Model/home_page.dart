
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'user_model.dart';

import 'update_page.dart'; // Import the UpdatePage

class home extends StatelessWidget {
  final Userdatamodel users_id;
  final FirebaseService firebaseService = FirebaseService();

  home({required this.users_id, required Userdatamodel user});

  BuildContext? get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'User Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Name: ${users_id.name}'),
            Text('Email: ${users_id.email}'),
            Text('Phone: ${users_id.phone}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Navigate to the update page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdatePage(user: users_id)),
                );
              },
              child: Text('Update User'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await _deleteUser(Userdatamodel());
              },
              child: Text('Delete User'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteUser(Userdatamodel user) async {
    try {
      await firebaseService.deleteUserFromFirestore(user.users_id??"");
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content: Text('User deleted successfully!'),
      ));
    } catch (e) {
      print('Error deleting user: $e');
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content: Text('Error deleting user. Please try again.'),
      ));
    }
  }
}
// id generate here in this class FirebaseServices class
class FirebaseService {
  deleteUserFromFirestore(String users_id) async{
  await  FirebaseFirestore.instance.collection("users").doc(users_id).delete();
  }

  insertUserFromFirestore(String id,Map<String,dynamic> data)async {
    await FirebaseFirestore.instance.collection("users").doc(id).set(data);
  }
  updateUserFromFirestore(String id, Userdatamodel updatedUser, )async {
    await FirebaseFirestore.instance.collection("users").doc("pEACLyDknB0v4Vuu9Q9l").update(updatedUser.toJson());
  }

}




