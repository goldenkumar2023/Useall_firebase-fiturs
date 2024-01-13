import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_screen.dart';


class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();

  insertData(){
    FirebaseFirestore.instance.collection("students").add({
      "name": _name.text,
      "email":  _email.text,
      "number":  _phone.text,
      "students_id": ""

    }).then((value){
      var id =value.id;
      FirebaseFirestore.instance.collection("students").doc(id).update({"students_id":id});
      Fluttertoast.showToast(msg: 'Data submit');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: 'not Data submit');
    });
  }

  //String generateRandomString(int len) {
  //   var r = Random();
  //   const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  //   return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  // }
  // insertData(){
  //   var id = generateRandomString(30);
  //   FirebaseFirestore.instance.collection("students").doc(id).set({
  //     "name": _name.text,
  //     "email":  _email.text,
  //     "number":  _phone.text,
  //     "students_id": id
  //
  //   }).then((value){
  //     // var id =value.id;
  //     // FirebaseFirestore.instance.collection("students").doc(id).update({"students_id":id});
  //     Fluttertoast.showToast(msg: 'Data submit');
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
  //   }).onError((error, stackTrace) {
  //     Fluttertoast.showToast(msg: 'not Data submit');
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text('Insert Data'),
      ),
      body:
      Center(
        child: Column(
          children: [
            SizedBox(height: 40,),

            SizedBox(
              width: 330,
              child: TextField(
                controller: _name,
                //obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),

            SizedBox(height: 10,),

            SizedBox(
              width: 330,
              child: TextField(
                controller: _email,
                //obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),

            SizedBox(height: 10,),

            SizedBox(
              width: 330,
              child: TextField(
                controller: _phone,
                //obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number',
                ),
              ),
            ),

            SizedBox(height: 10,),

            SizedBox(
              width: 330,
              child: TextField(
                controller: _password,
                //obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            SizedBox(height: 10,),

            SizedBox(
              height: 50,
              width: 200,
              child:ElevatedButton(onPressed: () {
                insertData();
              }, child: Text('Submit')),
            )
          ],
        ),
      ),
    );
  }
}