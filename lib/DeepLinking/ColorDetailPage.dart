import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class BookDetailsPage extends StatefulWidget {
  final int bookNo;
  final String bkName;
  final String bkDescription;
  final String bkPrice;
  final String bkImage;

  const BookDetailsPage({
    Key? key,
    required this.bookNo,
    required this.bkName,
    required this.bkDescription,
    required this.bkPrice,
    required this.bkImage,
  }) : super(key: key);

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  late String _shortLink = '';

  @override
  void initState() {
    super.initState();
    if (widget.bookNo != null) {
      _generateDynamicLink();
    }
  }
  Future<void> _generateDynamicLink() async {
    final DynamicLinkParameters dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: 'https://yourwebsite.page.link',
      link: Uri.parse('https://yourwebsite.page.link/book${widget.bookNo}'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.flipcart',
        fallbackUrl: Uri.parse(
            'https://play.google.com/store/apps/details?id=com.example.flipcart'),
      ),
    );

    final ShortDynamicLink shortLink = await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
    _shortLink = shortLink.shortUrl.toString();
    setState(() {}); // Update the UI with the generated short link
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Book Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 250,
            child: Image.asset(
              widget.bkImage,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.bkName,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.bkDescription,
              style: TextStyle(fontSize: 18),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add your buy logic here
            },
            child: Text('Buy ${widget.bkPrice}'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: _shortLink.isNotEmpty
                ? () {
              Share.share(_shortLink);
            }
           : null,
            child: Text('Share With Friends'),
          ),
        ],
      ),
    );
  }
}
