// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Insertdata extends StatefulWidget {
//   const Insertdata({super.key});
//
//   @override
//   State<Insertdata> createState() => _InsertdataState();
// }
//
// class _InsertdataState extends State<Insertdata> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Firestore Insert Data'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               insertData();
//             },
//             child: Text('Insert Data'),
//           ),
//         ),
//
//       ),
//     );
//   }
// Future<void>insertData()async{
// CollectionReference users = FirebaseFirestore.instance.collection('users');
// await users.add({
//   'name':'GoldenKumar',
//   'email':'goldenkumar@gmail.com',
//   'age':20,
//   'Address':'karnpura',
//   'phone':2563298569,
// });
// print('Data inserted successfully');
// }
// }
// // Inseart data in FirebaseFirestore (cloudFirestore) sending data by form (this method is dynamic);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipcart/firestoreDatabase/view_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Authationtest/home_screen.dart';

class InsertdatainColudfairstore extends StatefulWidget {
  const InsertdatainColudfairstore({Key? key}) : super(key: key);

  @override
  State<InsertdatainColudfairstore> createState() =>
      _InsertdatainColudfairstoreState();
}

class _InsertdatainColudfairstoreState extends State<InsertdatainColudfairstore> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  Future<void> insertUserData() async {
    try {
      var id = DateTime.now().millisecond;
      var data =  {
        'name': nameController.text,
        'email': emailController.text,  // Fix: Add .text here
        'phone': phoneController.text,
        'address': addressController.text,
        'age': ageController.text,
        'user_id' : '$id'
      };
      //insert
      FirebaseFirestore.instance.collection("users").doc(id.toString()).set(data).then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreens(),));
        Fluttertoast.showToast(msg: "Successfully");
      });

      //read all data of users collection
      FirebaseFirestore.instance.collection("users").get().then((value) {
        for (var element in value.docs) {
          print(element.data()['name']);
        }
      });
      //read one doc
      FirebaseFirestore.instance.collection("users").doc("MoC577Yyz6hbMms9AsM1").get().then((value) {

       print("one doc data" +value.data()?['name']);
      });

      //
      //add condition while reading
      FirebaseFirestore.instance.collection("orders").where("user_id",isEqualTo: "xaze").get().then((value) {
        for (var element in value.docs) {
          print(element.data()['name']);
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "Error $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert data in Cloud Firestore'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
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
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                width: 20,
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  insertUserData();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

