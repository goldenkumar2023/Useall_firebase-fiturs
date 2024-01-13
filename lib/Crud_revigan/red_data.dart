import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_screen.dart';

class Getdata extends StatefulWidget {
  const Getdata({super.key});

  @override
  State<Getdata> createState() => _GetdataState();
}

class _GetdataState extends State<Getdata> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController PhoneController=TextEditingController();

  Future<void>getdata()async{
    try{
      var id=DateTime.now().millisecond;
      var data={
        'name': nameController.text,
        'email':emailController.text,
        'phone':PhoneController.text,
        'user_id':'$id'
      };
      //insert data
      FirebaseFirestore.instance.collection("users").doc(id.toString()).set(data).then((value){
       Navigator.push(context, MaterialPageRoute(builder: (context) =>Viewdata()));
        Fluttertoast.showToast(msg: "successfully");
      });


      // red all data of users collecations

      FirebaseFirestore.instance.collection("users").get().then((value){
        for(var aliment in value.docs){
          print(aliment.data()['name']);
        }
      });

      // red once document

      FirebaseFirestore.instance.collection("users").doc(" pEACLyDknB0v4Vuu9Q9l").get().then((value){
        print("one doc . data"+value.data()?['name']);
      });

    //  //add condition while reading

      FirebaseFirestore.instance.collection("orders").where("user_id",isEqualTo: "xaze").get().then((value){
        for(var element in value.docs){
          print(element.data()['name']);
        }
      });
    }
    catch(e){
      Fluttertoast.showToast(msg: "$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CordOperation"),
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
                controller:emailController,
                decoration: InputDecoration(labelText: 'email'),
              ),
              TextFormField(
                controller: PhoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),

              ElevatedButton(
                onPressed: () {
                  getdata();
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


