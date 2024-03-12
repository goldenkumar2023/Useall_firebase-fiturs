import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  final String databaseName = "edugaon";
  final String userTable = "users";
  final String customerTable="customerTable";

  Database? _database;

  Future<Database?> intDatabase() async {
    if(_database != null) return _database;
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, databaseName);
    return openDatabase(path, version: 1, onCreate: createTable);
  }

  void createTable(Database db, int version)async {
    await db.execute("CREATE TABLE $userTable('id' INTEGER PRIMARY KEY, 'name' TEXT NOT NULL, 'email' TEXT NOT NULL, 'age' INTEGER NOT NULL, 'pass' TEXT NOT NULL)");
    await db.execute("CREATE TABLE $customerTable('id' INTEGER PRIMARY KEY, 'name' TEXT NOT NULL, 'email' TEXT NOT NULL, 'age' INTEGER NOT NULL, 'pass' TEXT NOT NULL)");
  }

// this is a function name  registerUser herre data inserting process.
  Future<int?> registerUser(Database? db, Map<String, dynamic> data) async {
    var result = await db?.insert(userTable, data);
    return result;
  }

  // CREATING A SECOND FUNCTION FOR INSERTING DATA
  Future<int?> InsertingData(Database db, Map<String, dynamic> storeData,) async {
    var db = await intDatabase();
    var result = await db?.insert( customerTable, storeData);
    return result;
  }


  // creating function for login
  Future<bool?> loginUser(String email, String password) async {
    var db = await intDatabase();
    final result = await db?.query(userTable,
        where: 'email = ? AND pass = ?', whereArgs: [email,password]);
    return result?.isNotEmpty; // Returns true if a matching user is found
  }

//creating  function for regestaction

  Future<bool?> siNUPuser(String password, String email) async {
    Database? db = await intDatabase();
    final result = await db?.query(userTable,
        where: 'email = ? AND pass = ?', whereArgs: [email, password]);
    return result?.isNotEmpty; // Returns true if a matching user is found
  }

  Future<List<Map<String, Object?>>?> getAllUser()async{
    var db = await intDatabase();
    return await db?.query(userTable);
  }
// createing function for update data from table

  Future<int> updateUser(Map<String, dynamic> userData, String id) async {
    var db = await intDatabase();
    if (db != null) {
      var uid = int.parse(id);
      try {
        return await db.update(
          userTable,
          userData,
          where: 'id = ?',
          whereArgs: [uid],
        );
      } catch (error) {
        print('Error updating user: $error');
        return 0; // Return 0 to indicate failure
      }
    } else {
      print('Database not initialized');
      return 0; // Return 0 to indicate failure
    }
  }

  // Function to delete user

  Future<int> deleteUser(String id) async {
    var db = await intDatabase();
    if (db != null) {
      var uid = int.parse(id);
      try {
        return await db.delete(
          userTable,
          where: 'id = ?',
          whereArgs: [uid],
        );
      } catch (error) {
        print('Error deleting user: $error');
        return 0;
      }
    } else {
      print('Database not initialized');
      return 0;
    }
  }
// Function to check if a user with giiven email already exists

Future<bool> checkUserExists(String email) async{
    var db =await intDatabase();
    final result = await db?.query(
      userTable,
      where: 'email = ?',whereArgs: [email]);
    return result != null && result.isNotEmpty;// Returens true if user exists
}
}
