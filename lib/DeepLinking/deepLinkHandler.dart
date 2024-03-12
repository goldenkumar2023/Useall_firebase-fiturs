import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

void main() {
  // Initialize the deep link handler
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized
  initUniLinks();
  runApp(MyApp());
}

void initUniLinks() async {
  // Ensure that the app is ready to handle deep links
  await getInitialUri();

  // Set up a stream subscription to handle deep links when the app is running
  uriSubscription = uriLinkStream.listen((Uri? uri) {
    handleDeepLink(uri??Uri.parse("uri"));
  }, onError: (Object err) {
    // Handle error if any
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}

void handleDeepLink(Uri uri) {
  // Process the deep link URI and navigate accordingly
  // You can extract parameters or perform specific actions based on the deep link data
}

StreamSubscription? uriSubscription; // Define stream subscription globally
