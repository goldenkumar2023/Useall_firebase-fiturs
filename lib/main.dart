
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Aplodimage/image_aplode.dart';
import 'Authationtest/home_screen.dart';
import 'Bymodel_insert_data/home_screen.dart';
import 'Bymodel_insert_data/insert_data.dart';
import 'CrudTest/add_data.dart';
import 'Crud_revigan/red_data.dart';
import 'DeepLinking/deepLinkHandler.dart';
import 'Model/insert_data.dart';
import 'Sqlite_localdatabase/SQflite_sudishsr/sqflite_login.dart';
import 'Timer/stop_watch.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(myapp());
}
class myapp extends StatelessWidget {

  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'phoneAuthation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home:PhoneAuthScreen(),      
      //home:HomePageTimer(),
      //home:InsertData(),
      //home: Insertingdatascreen(),

    );
  }
}