// Ansar Sir

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});
//
//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }
//
// class _TestScreenState extends State<TestScreen> {
//   @override
//   void initState() {
//     super.initState();
//
//     getData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//               future: getDataWithDoc(),
//               builder: (c, sna) {
//                 var data = sna.data?.data();
//                 // var data = sna.data?.docs.map((e) => e.data()).toList();
//                 return Text(data![0]["name"] ?? '');
//               }),
//           StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//               stream: getDataWithDocStream(),
//               builder: (c, snap) {
//                 var data = snap.data?.data();
//                 // var data = snap.data?.docs.map((e) => e.data()).toList();
//                 return Text("data");
//               }),
//           ElevatedButton(
//               onPressed: () {
//                 setData();
//                 // addData();
//               },
//               child: Text('Add data'))
//         ],
//       ),
//     );
//   }
//
//   addData() async {
//     // set data only matched key and other data will remove
//     var dbRef = FirebaseFirestore.instance;
//     var collection = dbRef.collection("products");
//     await collection.doc().set({"color": "blue", "name": "Shoose", "no": 9});
//   }
//
//   setData() async {
//     // set data only matched key and other data will remove
//     var dbRef = FirebaseFirestore.instance;
//     var collection = dbRef.collection("products");
//     await collection.doc().set({"color": "blue", "name": "Shoose", "no": 9});
//   }
//
//   Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
//     var dbRef = FirebaseFirestore.instance;
//     var collection = dbRef.collection("products");
//     var a = await collection.get();
//     return a;
//     // var a = data.docs;
//     //
//     // for(var i in a){
//     //   i.data();
//     // }
//   }
//
//   Future<DocumentSnapshot<Map<String, dynamic>>> getDataWithDoc()async{
//     var dbRef = FirebaseFirestore.instance;
//     var collection = dbRef.collection("products");
//     return await collection.doc("016z1CVyrDJKjMIX96Fg").get();
//   }
//
//   Stream<DocumentSnapshot<Map<String, dynamic>>> getDataWithDocStream(){
//     var dbRef = FirebaseFirestore.instance;
//     var collection = dbRef.collection("products");
//     return collection.doc("016z1CVyrDJKjMIX96Fg").snapshots();
//   }
//
//   Stream<QuerySnapshot<Map<String, dynamic>>> getDataIntoStream() {
//     var dbRef = FirebaseFirestore.instance;
//     var collection = dbRef.collection("products");
//     return collection.snapshots();
//   }
// }

// Golden


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class future extends StatefulWidget {
//   const future({super.key});
//
//   @override
//   State<future> createState() => _futureState();
// }
//
// class _futureState extends State<future> {
//   @override
//
//   void initState() {
//     super.initState();
//
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//       FutureBuilder(
//         future: getDataWithdocsStream(),
//         builder: (c,sna){
//           var data=sna.data?.data();
//
//
//         },
//
//       )
//         ],
//       ),
//     );
//   }
// Future<QuerySnapshot<Map<String,dynamic>>> getData()async{
//  var dbRef=FirebaseFirestore.instance;
//  var collecation=dbRef.collection("products");
//  var a= await collecation.get();
//  return a;
//   }
//   Future<DocumentSnapshot<Map<String, dynamic>>>getDataWithdocsStream(){
//     var dbRef=FirebaseFirestore.instance;
//     var collecation=dbRef.collection("products");
//     return collecation.doc("016z1CVyrDJKjMIX96Fg").get();
//   }
//
//   Stream<QuerySnapshot<Map<String, dynamic>>>getDataWithDocStream(){
//    var dbRef=FirebaseFirestore.instance;
//    var collecation=dbRef.collection("products");
//    return collecation.snapshots();
//   }
//
//   Stream<DocumentSnapshot<Map<String, dynamic>>>getDataWithDocs(){
//     var dbRef=FirebaseFirestore.instance;
//     var collecation=dbRef.collection("products");
//     return collecation.doc("016z1CVyrDJKjMIX96Fg").snapshots();
//
//
//
//   }
//
// }
//
