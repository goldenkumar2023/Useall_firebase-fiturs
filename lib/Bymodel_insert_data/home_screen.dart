import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipcart/Bymodel_insert_data/student_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _updateName =TextEditingController();
  TextEditingController _updatEmail =TextEditingController();
  TextEditingController _updatPhone =TextEditingController();

  void _handleUpdateProduct(String documentId) {
    String updateName = _updateName.text;
    String updateEmail = _updatEmail.text;
    String updatePhone = _updatPhone.text;

    FirebaseFirestore.instance.collection("students").doc(documentId).update({
      "name": updateName,
      "email": updateEmail,
      "number": updatePhone,
    }).then((value) {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard(),));
      // Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Updated successfully"),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to update data: $error"),
        ),
      );
    });
  }
  var fetchData= FirebaseFirestore.instance.collection('students');

  void openBottomSheet(String id) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Column(
            children: [
              SizedBox(height: 40,),

              SizedBox(
                width: 330,
                child: TextField(
                  controller: _updateName,
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
                  controller: _updatEmail,
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
                  controller: _updatPhone,
                  //obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number',
                  ),
                ),
              ),

              SizedBox(height: 10,),

              SizedBox(
                height: 50,
                width: 200,
                child:ElevatedButton(onPressed: () {

                  _handleUpdateProduct(id);
                  setState(() {

                  });
                }, child: Text('Submit')),
              )
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text('Home Page'),
      ),

      body: ListView(
        children: [
          SizedBox(height: 10,),

          Container(
            width: double.infinity,
            height: 1000,
            child: FutureBuilder(
              future: fetchData.get(),
              builder: (context, snp) {
                var data =  snp.data!.docs;
                //var modelList = data.map((e) => StudentModel.fromJson(e.data()));
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var doctment = data[index];
                    var modelData = StudentModel.fromJson(doctment.data());
                    return SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 10),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),

                          child: ListTile(
                              title: Text(modelData.name.toString()),
                              subtitle: Text(modelData.number.toString()),
                              trailing: Container(
                                height: 30,
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(onPressed: () {
                                      openBottomSheet(modelData.studentsId.toString());
                                    }, icon: Icon(Icons.edit)),
                                    IconButton(onPressed: () {
                                      deleteData(modelData.studentsId.toString());
                                    }, icon: Icon(Icons.delete)),
                                  ],
                                ),
                              )
                          ),
                        ),
                      ),
                    );
                  },);

              },),
          ),
        ],
      ),
    );
  }

  Future<void> deleteData(String documentsId) async {
    try {
      await FirebaseFirestore.instance.collection("students").doc(documentsId).delete();
      setState(() {});
      Fluttertoast.showToast(msg: "Document deleted successfully!");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error deleting document: $e");
    }
  }

// Future<void>updateData()async {
//   FirebaseFirestore.instance.collection("students").doc().update()
// }
}