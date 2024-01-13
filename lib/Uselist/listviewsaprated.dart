import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class listviewsaprated extends StatefulWidget {
  const listviewsaprated({super.key});

  @override
  State<listviewsaprated> createState() => _listviewsapratedState();
}

class _listviewsapratedState extends State<listviewsaprated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.separated")),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[100 * (index % 9)],
            child: Center(child: Text('Item $index')),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
        const Divider(color: Colors.black),
      ),
    );
  }
}


