import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipcart/firestoreDatabase/update_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Homescreens extends StatefulWidget {
  const Homescreens({super.key});

  @override
  State<Homescreens> createState() => _HomescreensState();
}

class _HomescreensState extends State<Homescreens> {

  var getData= FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Homepage'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Container(
            height: 200,
            child: FutureBuilder(
              future:getData.get() ,
              builder: (context, snapshot) {
                var data=snapshot.data?.docs;
               if(snapshot.connectionState == ConnectionState.waiting ){
                return   Container(child: CircularProgressIndicator(),);
               }
               else if(snapshot.hasData && snapshot.data != null && snapshot.data!.docs.isNotEmpty ){

                   return ListView.builder(
                   itemCount: data?.length,
                   itemBuilder: (context, index) {
                     var document=data![index];
                     return Container(
                       color: Colors.green,
                       height: 350,
                       width: 100,
                       child: Column(
                         children: [
                           Text("${document.data()['name']}",),
                           Text("${document.data()['email']}"),
                           Text("${document.data()['phone']}",),
                           Text("${document.data()['address']}",),
                           Text("${document.data()['age']}",),
                           IconButton(onPressed: () async{
                             var id = "${document.data()['user_id']}";
                             FirebaseFirestore.instance.collection("users").doc(id).delete().then((value) {
                               setState(() {

                               });
                             });
                           }, icon: Icon(Icons.delete)),
                           IconButton(onPressed: () async{
                             var id = "${document.data()['user_id']}";
                             Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateData(documentId: id),));
                           }, icon: Icon(Icons.edit))
                         ],
                       ),
                     );

                   },);
               }else{
               return  Container(child: Text("${snapshot.error}"),);
               }
              },
            ),
          ),
        ],
      ),

    );
  }
}
