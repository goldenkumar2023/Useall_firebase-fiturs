import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class listview extends StatefulWidget {
  const listview({super.key});

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview"),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),

          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),

          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),

          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),

          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),

          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),

          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),

          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),

          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),

          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),

          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.map,),
            title: Text('Map'),
          ),

        ],
      ),
    );
  }
}
