import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'sqflite_login.dart';
import 'widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Icon(Icons.email_rounded, size: 50),
                AppWidgets().editText("Enter name", nameController),
                AppWidgets().editText("Enter age", ageController),
                AppWidgets().editText("Enter email", emailController),
                AppWidgets().editText("Enter password", passController),
                Padding(
                  padding: EdgeInsets.all(15),

                  child: ElevatedButton(
                    onPressed: () async {
                     var dbs=await DatabaseHelper().intDatabase();
                      var ageInt = int.parse(ageController.text.toString());
                      var data = {
                        "name": nameController.text.toString(),
                        "email": emailController.text.toString(),
                        "age": ageInt,
                        "pass": passController.text.toString()
                      };

                  // Check if user with provided email already exists
                  bool userExists = await DatabaseHelper()
                  .checkUserExists(emailController.text.toString());

                  if (userExists) {
                    // User already exists, show error message
                    showDialog(
                      context: context,
                      builder: (context) =>
                          AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'User with this email already exists.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                    );
                  }else{
                  DatabaseHelper().registerUser(dbs,data).then((value) {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Insertingdatascreen()),
                  );
                  });
                  }
                  },
                  child: Text("Signup Now"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
