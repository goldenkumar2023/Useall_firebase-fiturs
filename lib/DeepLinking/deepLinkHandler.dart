// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'ColorAPPHomePage.dart';
//
// class Deeplink extends StatefulWidget {
//   const Deeplink({Key? key}) : super(key: key);
//
//   @override
//   State<Deeplink> createState() => _DeeplinkState();
// }
//
// class _DeeplinkState extends State<Deeplink> {
//   late final GoRouter _router;
//
//   @override
//   void initState() {
//     super.initState();
//     _router = GoRouter(
//       initialLocation: '/home', // Set the initial location
//       errorPageBuilder: (context, state) => MaterialPage(
//         key: state.pageKey,
//         child: Scaffold(
//           body: Center(
//             child: Text('Page Not Found'),
//           ),
//         ),
//       ),
//       routes: [
//         GoRoute(
//           path: '/home',
//           builder: (context, state) => const ColorAPPHomePage(path: ''),
//         ),
//         GoRoute(
//           path: '/red',
//           builder: (context, state) => BookDetailsPage(
//             colorName: 'Red',
//             colorHex: '#FF0000',
//             // Pass appropriate values for BookDetailsPage properties
//             bookNo: '001',
//             bkName: 'Book Name',
//             bkDescription: 'Book Description',
//             bkPrice: '\$9.99',
//             bkImage: 'assets/images/red_book.png',
//           ),
//         ),
//         GoRoute(
//           path: '/blue',
//           builder: (context, state) => BookDetailsPage(
//             colorName: 'Blue',
//             colorHex: '#0000FF',
//             // Pass appropriate values for BookDetailsPage properties
//             bookNo: '002',
//             bkName: 'Blue Book',
//             bkDescription: 'Description of Blue Book',
//             bkPrice: '\$12.99',
//             bkImage: 'assets/images/blue_book.png',
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       title: 'Deep Linking Flutter',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
//       ),
//       routerDelegate: _router.routerDelegate,
//       routeInformationParser: _router.routeInformationParser,
//     );
//   }
// }
//
// class BookDetailsPage extends StatefulWidget {
//   final String colorName;
//   final String colorHex;
//   final String bookNo;
//   final String bkName;
//   final String bkDescription;
//   final String bkPrice;
//   final String bkImage;
//
//   const BookDetailsPage({
//     Key? key,
//     required this.colorName,
//     required this.colorHex,
//     required this.bookNo,
//     required this.bkName,
//     required this.bkDescription,
//     required this.bkPrice,
//     required this.bkImage,
//   }) : super(key: key);
//
//   @override
//   State<BookDetailsPage> createState() => _BookDetailsPageState();
// }
//
// class _BookDetailsPageState extends State<BookDetailsPage> {
//   @override
//   Widget build(BuildContext context) {
//     // Your BookDetailsPage implementation
//     return Container();
//   }
// }
