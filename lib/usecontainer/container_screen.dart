import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Containerscreen extends StatefulWidget {
  const Containerscreen({Key? key}) : super(key: key);

  @override
  State<Containerscreen> createState() => _ContainerscreenState();
}

class _ContainerscreenState extends State<Containerscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container in Scaffold Example'),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      'C1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Container(
                height: 300,
                width: 400,
                color: Colors.red,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Container(
                        height: 200,
                        width: 100,
                        color: Colors.orange,
                      ),
                    ),

                    SizedBox(width: 8),
                    Container(
                      height: 200,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 100,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 200,
                        width: 100,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

