// import 'package:flipcart/Sqlite_localdatabase/db_helper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class DatabaseScreen extends StatefulWidget {
//   const DatabaseScreen({super.key});
//
//   @override
//   State<DatabaseScreen> createState() => _DatabaseScreenState();
// }
//
// class _DatabaseScreenState extends State<DatabaseScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             // create a button
//             ElevatedButton(onPressed: ()async {
//              await DatabaseHelper.instance.insertRecord({DatabaseHelper.columanName:"Baba Devs"});
//             }, child: Text("insert")),
//             // read button
//             ElevatedButton(onPressed: ()async {
//              var dbquery = await DatabaseHelper.instance.queryDatabase();
//             print(dbquery);
//             }, child: Text("Read")),
//           // UPdate button
//             ElevatedButton(onPressed: () async{
//              await DatabaseHelper.instance
//                  .updateRecord({DatabaseHelper.columnId:2,DatabaseHelper.columanName:"golden"});
//             }, child: Text("Update")),
//           // delete button
//             ElevatedButton(onPressed: () async{
//               await DatabaseHelper.instance.delete(3);
//             }, child: Text("Delete"))
//           ],
//         ),
//       ),
//     );
//   }
// }

// two


// import 'package:flipcart/Sqlite_localdatabase/db_helper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Homepage extends StatefulWidget {
//   Homepage({Key? Key}) : super(key: key);
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   List<Map<String, dynamic>>_journals = [];
//
//   bool _isLoading = true;
//
//   void _refreshjournals() async {
//     final data = await SQLHelper.getItems();
//     setState(() {
//       _journals = data;
//       _isLoading = false;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _refreshjournals();
//     print("..number of items ${_journals.length}");
//   }
//
//   final TextEditingController _titlecontroller = TextEditingController();
//   final TextEditingController _descriptioncontroller = TextEditingController();
//
//   Future<void> _addItem() async {
//     await SQLHelper.createItem(
//         _titlecontroller.text, _descriptioncontroller.text);
//     _refreshjournals();
//     print("..number of items ${_journals.length}");
//   }
//
//   Future<void> _updateItem(int id) async {
//     await SQLHelper.updateItem(
//         id, _titlecontroller.text, _descriptioncontroller.text);
//     _refreshjournals();
//   }
//
//   void _deleteItem(int id) async {
//     await SQLHelper.deleteItem(id);
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Successfully deleted a journal!'),
//     ));
//     _refreshjournals();
//   }
//
//
//   void _showForm(int? id) async {
//     if (id != null) {
//       final existingJournal =
//       _journals.firstWhere((element) => ['id'] == id);
//       _titlecontroller.Text = existingJournal['title'];
//       _descriptioncontroller.text = existingJournal['description'];
//     }
//
//     showModalBottomSheet(
//       context: context,
//       elevation: 5,
//       isScrollControlled: true,
//       builder: (_) =>
//           Container(
//             padding: EdgeInsets.only(
//               top: 15,
//               left: 15,
//               right: 15,
//               // this will prevent the soft keybord from covering the txt fields
//               bottom: MediaQuery
//                   .of(context)
//                   .viewInsets
//                   .bottom + 120,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 TextField(
//                   controller: _titlecontroller,
//                   decoration: InputDecoration(hintText: 'Title'),
//                 ),
//                 SizedBox(height: 10,),
//
//                 TextField(
//                   controller: _descriptioncontroller,
//                   decoration: InputDecoration(
//                       hintText: 'descriptioncontroller'),
//                 ),
//                 SizedBox(height: 20,),
//
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (id == null) {
//                       await _addItem();
//                     }
//
//                     if (id != null) {
//                       await _updateItem(id);
//                     }
//                     // Clear the text fields
//                     _titlecontroller.text = '';
//                     _descriptioncontroller.text'';
//                     // Close the bottom sheet
//                     Navigator.of(context).pop();
//                   },
//                   child: Text(id == null ? 'Create New' : 'UPdate'),
//                 )
//
//
//               ],
//             ),
//
//           ),
//     );
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SQL'),
//       ),
//       body: ListView.builder(
//         itemCount: _journals.length,
//         itemBuilder: (context, index) =>
//             Card(
//               color: Colors.orange[200],
//               margin: EdgeInsets.all(15),
//               child: ListTile(
//                 title: Text(_journals[index] ['title']),
//                 subtitle: Text(_journals[index] ['Description']),
//                 trailing: SizedBox(
//                   width: 100,
//                   child: Row(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: () => _showForm(_journals[index] ['id']),
//                       ),
//
//                       IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () =>
//                             _deleteItem(_journals[index]['id']),
//                       )
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => _ShowForm(null),
//       ),
//     );
//   }
// }


