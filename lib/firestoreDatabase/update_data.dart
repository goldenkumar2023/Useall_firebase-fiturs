import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateData extends StatefulWidget {
  final String documentId;

  UpdateData({Key? key, required this.documentId}) : super(key: key);

  @override
  State<UpdateData> createState() => _EditDataPageState();
}

class _EditDataPageState extends State<UpdateData> {
  final CollectionReference data = FirebaseFirestore.instance.collection("users");

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

 Future<void> fetchData() async {
    try {
      DocumentSnapshot doc = await data.doc(widget.documentId).get();
      if (doc.exists) {


           nameController.text = doc.get('name') ?? '';
          emailController.text = doc.get('email') ?? '';
          phoneController.text = doc.get('phone') ?? '';
         addressController.text=doc.get('address')?? '';
        ageController.text=doc.get('age')??'';
        setState(() {

        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void >updateData() async {
    try {
      await data.doc(widget.documentId).update({
        "name": nameController.text.toString(),
        "email": emailController.text.toString(),
        "phone": phoneController.text.toString(),
        "address":addressController.text.toString(),
        "age":ageController.text.toString(),
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Data Updated Successfully'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        content: Text('Error updating data $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Your name",
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Your email",
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Your phone",
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: addressController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Your address",
              ),
            ),
           SizedBox(height: 16.0,),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Your age",
              ),
            ),

            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: updateData,
              child: const Text("Update Data"),
            ),
          ],
        ),
      ),
    );
  }
}
