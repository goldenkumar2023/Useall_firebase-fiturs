// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class SharePrefrences extends StatefulWidget {
//   const SharePrefrences({super.key});
//
//   @override
//   State<SharePrefrences> createState() => _SharePrefrencesState();
// }
//
// class _SharePrefrencesState extends State<SharePrefrences> {
//   String name = '';
//   late int age;
//
//   @override
//
//   void initState(){
//     super.initState();
//     isLogin();
//   }
//
//   void isLogin()async{
//     SharePrefrences sp = await SharePrefrences.getInstance();
//     name = sp.getString('string')?? '';
//     age = sp.getInt('age') ?? 0;
//
//     setState(() {
//
//   });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shared Preferance'),
//       ),
//       body:  Column(
//         children: [
//       Text(name.toString()),
//           Text(age.toString())
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           SharePrefrences sp = await SharePrefrences.getInstance();
//
//
//           // sp.setInt('age',25);
//           // sp.setDouble('lucky_number',20.2);
//           // sp.setString('string','Asif Taj');
//           // sp.setBool('isLogin',false);
//
//          // name = sp.getString('string') ?? '';
//
//
//           setState(() {
//
//           });
//
//           },
//
//         child: Icon(Icons.add),
//
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shareprefrence',
      home: shareprefrenc(),
    );
  }
}

class shareprefrenc extends StatefulWidget {
  const shareprefrenc({Key? key}) : super(key: key);

  @override
  _shareprefrencState createState() => _shareprefrencState();
}

class _shareprefrencState extends State<shareprefrenc> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  String _name = '';
  int ?_pincode;
  int? _age;
  bool _isMarried = false;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _pincode = prefs.getInt('pincode') ?? 0;
      _age = prefs.getInt('age') ?? 0;
      _isMarried = prefs.getBool('isMarried') ?? false;
    });
  }

  deleteData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('pincode');
    prefs.remove('age');
    prefs.remove('isMarried');
    getData();
    setState(() {});
  }

  _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() async {
      _name =  prefs.getString("name") ?? '';
      _pincode = prefs.getInt("pincode") ?? 0;
      _age = prefs.getInt("age") ?? 0;
      _isMarried = prefs.getBool('isMarried') ?? false;
    });
  }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setInt('pincode', int.parse(_pincodeController.text));
    prefs.setInt('age', int.parse(_ageController.text));
    prefs.setBool('isMarried', _isMarried);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shareprefrences'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _pincodeController,
              decoration: InputDecoration(
                labelText: 'Pincode',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Age',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Text('Marital Status:'),
                Checkbox(
                  value: _isMarried,
                  onChanged: (value) {
                    setState(() {
                      _isMarried = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _saveData();
                // Perform login logic here
                String name = _nameController.text;
                String pincode = _pincodeController.text;
                String age = _ageController.text;
                print('Name: $name');
                print('Pincode: $pincode');
                print('Age: $age');
                print('Marital Status: $_isMarried');
              },
              child: Text('Save'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async{
                await getData();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Showdatascreen()),
                );
              },
              child: Text("Get Data"),
            ),

            ElevatedButton(
              onPressed: () {
                deleteData();
                // Perform delete logic here
                print('Data deleted successfully');
              },
              child: Text('Delete Data'),
            ),

            ElevatedButton(
              onPressed: () {
                // Perform delete logic here
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Showdatascreen()));
              },
              child: Text('AddData'),
            ),

            Text('$_name'),
            Text(_pincode.toString()),
            Text(_age.toString()),
            Text(_isMarried.toString()),
          ],
        ),
      ),
    );
  }
}


class Showdatascreen extends StatefulWidget {
  const Showdatascreen({super.key});

  @override
  State<Showdatascreen> createState() => _ShowdatascreenState();
}

class _ShowdatascreenState extends State<Showdatascreen> {

  String _name = '';
  int ?_pincode;
  int? _age;
  bool _isMarried = false;


  @override

  addData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _pincode = prefs.getInt('pincode') ?? 0;
      _age = prefs.getInt('age') ?? 0;
      _isMarried = prefs.getBool('isMarried') ?? false;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ShowDataScreen',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () async{
              await addData();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Showdatascreen()),
              );
            },
            child: Text("ViewData"),
          ),

          Text('$_name'),
          Text(_pincode.toString()),
          Text(_age.toString()),
          Text(_isMarried.toString()),


        ],
      ),
    );
  }
}

