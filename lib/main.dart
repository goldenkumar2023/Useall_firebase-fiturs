import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Aplodimage/image_aplode.dart';
import 'Authationtest/home_screen.dart';
import 'Bymodel_insert_data/home_screen.dart';
import 'Bymodel_insert_data/insert_data.dart';
import 'CrudTest/add_data.dart';
import 'Crud_revigan/red_data.dart';
import 'DeepLinking/colorAppHomePage.dart';
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
  // Get any initial links
  final PendingDynamicLinkData? initialLink =
  await FirebaseDynamicLinks.instance.getInitialLink();

  runApp(MyApp(
    initialLink: initialLink,
  ));
}

class MyApp extends StatelessWidget {
  final PendingDynamicLinkData? initialLink;

  MyApp({Key? key, this.initialLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'phoneAuthation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        //initialLink: initialLink,
    ),
      // home:PhoneAuthScreen(),
      // home:HomePageTimer(),
      // home:InsertData(),
      // home: Insertingdatascreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final PendingDynamicLinkData? initialLink;

  MyHomePage({Key? key, this.initialLink}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? path;

  @override
  void initState() {;
    if (widget.initialLink != null) {
      path = widget.initialLink!.link.path;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColorAPPHomePage(
      path: path ?? '',
    );
  }
}
