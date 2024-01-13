import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController NameController=TextEditingController();
  TextEditingController AgeController=TextEditingController();

  // you can see five function useing by add method


  //F1.
  addData()async{
    var dbRef=FirebaseFirestore.instance;
    var collecation=dbRef.collection("student");
    await collecation.add({"Name":"goldenkumar","Age":20});
  }

  // //F2.
  // setDataa()async{
  //   var data=FirebaseFirestore.instance;
  //   var sett =data.collection(" ");
  //   await sett.add({"Name":"goldenkumar","Age":20});
  //
  // }
  // setDatax()async{
  //   var dataa=FirebaseFirestore.instance;
  //   var setn =dataa.collection(" ");
  //   await setn.add({"Name":"goldenkumar","Age":20});
  //
  // }
  // setDatas()async{
  //   var skb=FirebaseFirestore.instance;
  //   var setnx =skb.collection(" ");
  //   await setnx.add({"Name":"goldenkumar","Age":20});
  // }
  //
  // setDataxyz()async{
  //   var xyz=FirebaseFirestore.instance;
  //   var setnx =xyz.collection(" ");
  //   await setnx.add({"Name":"goldenkumar","Age":20});
  // }
  //

  // you can see five function useing by Set  method

  // setData()async{
  //   var setData=FirebaseFirestore.instance;
  //   var data=setData.collection(" teachers");
  //   await data.doc().set({ "Name":"goldenkumar","Age":20});
  // }

   // SetDatax()async{
   //  var zz= FirebaseFirestore.instance;
   //  var yy=zz.collection(" ");
   //  await yy.doc().set({ "Name":"goldenkumar","Age":20} );
   // }


  //  SetDatay()async{
  //   var gg=FirebaseFirestore.instance;
  //   var kk=gg.collection(" ");
  //   await kk .doc().set({"Name":"goldenkumar","Age":20} );
  // }

  // setDatacc()async{
  //   var cc= FirebaseFirestore.instance;
  //   var mm=cc.collection("");
  //   await mm.doc().set({"Name":"goldenkumar","Age":20});
  // }


  // setDatajj()async{
  //   var cc= FirebaseFirestore.instance;
  //   var mm=cc.collection("");
  //   await mm.doc().set({"Name":"goldenkumar","Age":20});
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add data in firebaseFirestore"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: NameController,
                decoration: InputDecoration(
                  labelText: "Name"
                ),
              ),

              TextFormField(
                controller: AgeController,
                decoration: InputDecoration(
                  labelText: "Age"
                ),
              ),
              ElevatedButton(onPressed: () {
                addData();
              }, child: Text("submit"))

            ],
          ),
        ),
      ),
    );
  }
}
