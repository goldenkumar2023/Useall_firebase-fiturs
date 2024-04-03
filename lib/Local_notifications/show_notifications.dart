import 'package:firebase_core/firebase_core.dart';
import 'package:flipcart/Local_notifications/NotiClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {

  MyApp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LocalNotifications',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LocalNotification(),

    );
  }
}

class LocalNotification extends StatefulWidget {
  const LocalNotification({super.key});

  @override
  State<LocalNotification> createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {

  NotificationServices notificationServices = NotificationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("LocalNotification"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                notificationServices.sendNotification();
            },
              child: Text("Send Noti"),
            ),

            ElevatedButton(onPressed: () {
              notificationServices.ScheduleNotification();
            }, child: Text("Schedule Not "),
            ),

            ElevatedButton(onPressed: () {
              notificationServices.StopNoti();
            }, child: Text("StopNoti"),
            ),

          ],
        ),
      ),
    );
  }
}
