import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class listviewbuilder extends StatefulWidget {
  const listviewbuilder({super.key});

  @override
  State<listviewbuilder> createState() => _listviewbuilderState();
}

class _listviewbuilderState extends State<listviewbuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView Tutorial")),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Item $index"),
            subtitle: Text("Subtitle $index"),
            leading: const Icon(Icons.account_circle),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}


