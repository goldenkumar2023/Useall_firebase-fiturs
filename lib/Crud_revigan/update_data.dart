import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  final String documentId;

  const Update({Key? key, required this.documentId}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final CollectionReference data = FirebaseFirestore.instance.collection("users");

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
        phoneController.text = doc.get('Phone') ?? '';

        setState(() {});
      }
    } catch (e) {
      print('FetchingData: $e');
    }
  }

  Future<void> updateData() async {
    try {
      await data.doc(widget.documentId).update({
        "name": nameController.text.toString(),
        "email": emailController.text.toString(),
        "Phone": phoneController.text.toString(),
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Data Updated Successfully'),
      ));
    } catch (e) {
      print('UpdateData: $e');
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
            ElevatedButton(
              onPressed: () {
                updateData();
              },
              child: const Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}