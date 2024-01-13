import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipcart/Crud_revigan/update_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Viewdata extends StatefulWidget {
  const Viewdata({super.key});

  @override
  State<Viewdata> createState() => _ViewdataState();
}

class _ViewdataState extends State<Viewdata> {

  var redData=FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("ShowData"),
      ),
      body: ListView(
        children: [
          SizedBox(height:20),
          Container(
            height: 200,
            child: FutureBuilder(
              future:redData.get() ,
              builder: (context, snapshot) {
                var data=snapshot.data?.docs;
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Container(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData && snapshot.data != null && snapshot.data!.docs.isNotEmpty){

                  return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      var document=data![index];
                    return Container(
                      height: 350,
                      width: 100,
                      color: Colors.blue,
                      child:  Column(
                        children: [
                          Text("${document.data()['name']}"),
                          Text("${document.data()['email']}"),
                          Text("${document.data()['Phone']}"),
                        IconButton(onPressed: ()async{
                          var id = "${document.data()["user_id"]}";
                        FirebaseFirestore.instance.collection("users").doc(id).delete().then((value){
                          setState(() {

                          });
                        });


                        }, icon: Icon(Icons.delete)),

                        IconButton(onPressed: () {
                          var id = "${document.data()["user_id"]}";
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Update(documentId: 'documentId',),));
                        }, icon: Icon(Icons.edit))

                        ],
                      ),

                    );
                  },);
                }
                else{
                  return Container(child: Text("${snapshot.error}"),);
                }
              },

            ),

          )
     ],
      ),

    );
  }
}
