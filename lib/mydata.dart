import 'package:flutter/material.dart';

class MyData extends StatefulWidget {
  const MyData({super.key});

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Ajay"),),
    );
  }
}
