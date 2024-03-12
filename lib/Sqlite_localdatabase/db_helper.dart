// import 'dart:io';
//
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DatabaseHelper{
//   // variables
//   static const dbName="myDatabase.db";
//   static const dbVersion = 1;
//   static const dbTable = "myTable";
//   static const columnId = 'id';
//   static const columanName = 'name';
//
//   // constructor
// static final DatabaseHelper instance = DatabaseHelper();
//
// // database initialise
//
// static Database? _database;
// Future<Database> get database async{
//  _database?? = await initDB();
//  return _database;
// }
// initDB() async{
//   Directory directory = await getApplicationDocumentsDirectory();
// String path = join(directory.path,dbName);
// return await openDatabase(path,version: dbVersion,onCreate: onCreate);
// }
//
// Future onCreate(Database db, int version) async{
//   db.execute(
//     '''
//     CREATE TABLE $dbTable(
//     $columnId INTEGER PRIMARY KEY,
//     $columanName TEXT NOT NULL
//     )
//       ''');
// }
// // insert method
// insertRecord (Map<String,dynamic> row)async{
//   Database? db = await instance.database;
//   return await db!.insert(dbTable, row);
// }
//
// // read/query method
//
// Future<List<Map<String,dynamic>>>queryDatabase()async{
//   Database? db = await instance.database;
//   return await db!.query(dbTable);
// }
// // update method
//
// Future<int> updateRecord(Map<String,dynamic> row) async{
//   Database? db = await instance.database;
//  int id = row[columnId];
//  return await db!.update(dbTable,row,where: '$columnId = ?',whereArgs: [id]);
// }
// // delete method
//
// Future<int> delete(int id )async{
//   Database? db = await instance.database;
//   return await db!.delete(dbTable,where: '$columnId = ?'whereArgs: [id]);
// }
//
// }


//two

//  import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqflite.dart';
//
// class SQLHelper{
//   static Future<void>createTables(sql.Database database)async{
//     await database.execute(""" CREATE TABLES items(
//     id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//     title TEXT,
//     description TEXT,
//     createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
//     ) """);
//   }
//
// static Future< sql.Database> db() async{
//     return sql.openDatabase(
//       'destech.db',
//       version:1,
//       onCreate:(sql.Database database, int version) async{
//         print("...creating a table...");
//         await createTables(database);
//       }
//       );
//   }
// static Future<int>createItem(String title, String?  description) async{
//     final db = await SQLHelper.db();
//
//     final data = {'title': title, 'description':description};
//     final  id = await db.insert('items',data,
//       conflictAlgorithm:sql.conflictAlgorithm.replace);
//     return id;
// }
//
// static Future<List<Map<String,dynamic>>>getItems()async{
//     final db = await SQLHelper.db();
//     return db.query('items',orderBy:"id");
// }
//
// static Future<List<Map<String,dynamic>>>getItem(int id)async{
//     final db = await SQLHelper.db();
//     return db.query('items', where:"id = ?",whereArgs:[id],limit:1);
// }
//
// static Future<int> updateItem(
//     int id, String title, String? description)async{
//     final db = await SQLHelper.db();
//
//     final data = {
//       'title':title,
//       'description': description,
//       'createdAt':DateTime.now().toString()
//     };
//
//     final result =
//         await db .update('items',data, where:"id = ?", whereArgs:[id]);
//      return result;
// }
//
// static Future<void> deleteItem(int id )async{
//     final db = await SQLHelper.db();
//     try{
//       await db.delete(("items",where:"id = ?", whereArgs:[id]));
//
//     }catch(err){
//       debugPrint("Somethings went wrong whene deleting an item: $err");
//     }
// }

// import 'dart:io';
//
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DatabaseHelper{
//   static DatabaseHelper _databaseHelper;// Singletion DatabaseHelper
//   static Database _database; // Singletion Database
//
//   String noteTable = 'note_table';
//   String colId = 'id';
//   String colTitle = 'title';
//   String colDescription = 'Description';
//   String colPriority = 'Priority';
//   String colDate = 'date';
//
//
//   DatabaseHelper._createInstance(); // Name constructor to create instance of DatabaseHelper
//
//   factory DatabaseHelper(){
//
//     if(_databaseHelper==null){
//       _databaseHelper=DatabaseHelper._createInstance();
//     }
//
//   _databaseHelper = DatabaseHelper. _createInstance();
//
//   return _databaseHelper;
// }
// Future<Database> get database async{
//     if(_database == null){
//       _database = await initializeDatabase();
//     }
//     return _database;
// }
//
//
//  Future<Database>initializeDatabase() async{
//     // Get the directory path for both Androide and ios to store database.
//   Directory directory =  await getApplicationDocumentsDirectory();
//   String path = directory.path + 'notes.db';
//
// // Open/Create the database at a given path
//   var notesDatabase = await openDatabase(path,version: 1,onCreate: _createDb);
// return notesDatabase;
//
//   }
//
//   void _createDb(Database db, int newVersion) async{
//     await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,'
//         '$colDescription TEXT,$colPriority INTEGER, $colDate TEXT)');
// }
// // Fatch Operaction:Insert all Note object from  database
//    Future<List<Map<String,dynamic>>>getNoteMapList()async{
//     Database db = await this.database;
//     //var result = await db .rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
//     var result = await db.rawQuery(noteTable,orderBy:'$colPriority ASC');
//     return result;
//   }
// // Insert Operaction: Insert a Note object to database
//
// Future<int> insertNote(Note note) async{
//     Database db = await this.database;
//     var result = await db.insert(noteTable,note.toMap());
//     return result;
// }
// // Update Operaction: Update a Note object and save it to database
//
// Future<int> updateNote(Note note) async{
//     var db = await this.database;
//     var result = await db.update(noteTable,note.toMap(),where: '$colId = ?',whereArgs:[note.id]);
//   return result;
//   }
//   // Delete Operaction:Update a Note object from database
// Future<int> deleteNote(int id) async{
//     var db = await this.database;
//     int result = await db . rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
//    return result;
//   }
//   // Get number of Note objects in database
// Future<int> getCount() async{
//     Database db = await this.database;
//     List<Map<String,dynamic>> x = await db .rawQuery('SELECT COUNT (*) from $noteTable');
//     int result = Sqflite.firstIntValue(x);
//     return result;
// }
// }