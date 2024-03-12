import 'package:flipcart/Sqlite_localdatabase/SQflite_sudishsr/database_helper.dart';
import 'package:flipcart/Sqlite_localdatabase/SQflite_sudishsr/profile_screen.dart';
import 'package:flipcart/firestoreDatabase/update_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class UpdateUserScreen extends StatefulWidget {
  final String userId;
  final String userName;
  final String userEmail;

  final Map<String, dynamic> userData;

   UpdateUserScreen({
    Key? key,
    required this.userId,
    required this.userName,
    required this.userEmail, required this.userData,
  }) : super(key: key);

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController ageController;
  late TextEditingController passController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text:widget.userData['name'].toString()??'');
    emailController = TextEditingController(text: widget.userData['email'].toString()??'');
    ageController = TextEditingController(text: widget.userData['age'].toString() ??'');
    passController = TextEditingController(text: widget.userData['pass'].toString() ??'');
  }
  // fatchData function is not useing there
  Future<void> fatchData( Map String, dynamic) async {

    final db = await DatabaseHelper().intDatabase();
    final user = await db?.query(
        'users', where: 'id = ?', whereArgs: [widget.userId]);
    setState(() {
      nameController.text = user?.first['name'].toString()??"";
      emailController.text = user?.first['email'].toString()??"";
      ageController.text = user?.first['age'].toString()??"";
      passController.text = user?.first['pass'].toString()??"";
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),

            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),

            TextFormField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
            ),

            TextFormField(
              controller: passController,
              decoration: InputDecoration(labelText: 'Password'),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () async{
                Map<String, dynamic> updatedUserData = {

                  'name': nameController.text,
                  'email': emailController.text,
                  'age': int.parse(ageController.text),
                  'pass': passController.text,
                };
                setState(() {

                });
              int rowsAffected = await DatabaseHelper().updateUser(updatedUserData, widget.userId );
              if (rowsAffected > 0) {
              // Data updated successfully
              print('User updated successfully');
              Navigator.pop(context);
              } else {
                // Handle update failure
                print('Failed to update user');
              }
                },
              child: Center(child: Text('update')),
            ),

          ],
        ),
      ),

    );
  }
}
