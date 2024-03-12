import 'package:flipcart/Sqlite_localdatabase/SQflite_sudishsr/signup_screen.dart';
import 'package:flipcart/Sqlite_localdatabase/SQflite_sudishsr/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'homescreen.dart';


class Insertingdatascreen extends StatefulWidget {
   Insertingdatascreen({super.key});

  @override
  State<Insertingdatascreen> createState() => _InsertingdatascreenState();
}

class _InsertingdatascreenState extends State<Insertingdatascreen> {
  var dbHelper=DatabaseHelper();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Icon(Icons.insert_chart,size: 50),
          ),
          AppWidgets().editText("Enter email", emailController),
          AppWidgets().editText("Enter password", passController),
          Padding(
            padding: EdgeInsets.all(15),
            child: ElevatedButton(onPressed: () async{
              var db = await  DatabaseHelper().intDatabase();
            DatabaseHelper().loginUser(emailController.text,  passController.text).then((value) {
              if(value == true){
               Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => HomeScreen(),
                   ));
             }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Not registered user!'),
                ));
             }
              });
            // String email=emailController.text.trim();
            // String password=passController.text.trim();
            },

              child:  Text("Signin Now"),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15),
            child: ElevatedButton(onPressed: () async{
             // var db = await  DatabaseHelper().intDatabase();
              DatabaseHelper().siNUPuser(emailController.text, passController.text).then((value) async {
                if(value != 0){
                  // SigNupSucessfully
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('faill'),
                  ));
                }
              });
              String email=emailController.text.trim();
              String password=passController.text.trim();
            },

              child:  Text("SigNup"),
            ),
          ),
        ],
      ),
    );
  }
}
