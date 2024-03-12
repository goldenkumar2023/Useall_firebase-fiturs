import 'package:flipcart/Sqlite_localdatabase/SQflite_sudishsr/database_helper.dart';
import 'package:flipcart/Sqlite_localdatabase/SQflite_sudishsr/updateuser_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}):super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String userId;

// Function to fetch user data
  Future<Map<String, dynamic>> fetchUserData({required String userId}) async {
    final db = await DatabaseHelper().intDatabase();
    final user = await db?.query('users', where: 'id = ?', whereArgs: [userId]);
    return user?.first ?? {}; // Return user data or an empty map if not found
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: FutureBuilder(
          future: DatabaseHelper().getAllUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'),);
            } else {
              final userData = snapshot.data !;
              return ListView.builder(
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  final user = userData [index];
                  return ListTile(

                    title: Text(user['name'].toString()),
                    subtitle: Text(user['email'].toString()),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          iconSize: 20,
                          onPressed: () async {
                            Map<String, dynamic> userData = await fetchUserData(
                                userId: user['id'].toString());
                            await Navigator.push(
                                context,
                                MaterialPageRoute(

                                  builder: (context) =>
                                      UpdateUserScreen(
                                        userId: user['id'].toString(),
                                        userName: userData['name'],
                                        userEmail: userData['email'],
                                        userData: userData,

                                      ),
                                ));
                          },
                        ),
                        IconButton(
                            icon: Icon(Icons.delete),
                            iconSize: 20,
                            onPressed: () async {
                              // Show confirmation dialog before deleting
                              bool confirmDelete = await showDialog(
                                context: context,
                                builder: (context) =>
                                    AlertDialog(
                                      title: Text('Delete User'),
                                      content: Text(
                                          'Are you sure you want to delete ${user['name']}?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, false);
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, true);
                                          },
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    ),
                              );

                              if (confirmDelete == true) {
                                // Call delete method and pass user ID
                                int rowsDeleted = await DatabaseHelper()
                                    .deleteUser(user['id'].toString());
                                if (rowsDeleted > 0) {
                                  // User successfully deleted, refresh UI
                                  setState(() {});
                                }
                              }
                            }

                        )
                      ],
                    ),
                  );
                },

              );
            }
          },
        )
    );
  }
}
