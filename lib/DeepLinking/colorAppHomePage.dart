import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'ColorDetailPage.dart';

class ColorAPPHomePage extends StatefulWidget {
  final String? path;

  const ColorAPPHomePage({Key? key, required this.path}) : super(key: key);

  @override
  State<ColorAPPHomePage> createState() => _ColorAPPHomePageState();
}

class _ColorAPPHomePageState extends State<ColorAPPHomePage> {
  List<String> bookImgs = [
    "assets/img_01.webp",
    "assets/img_02.webp",
    "assets/img_03.webp",
    "assets/img_04.webp",
    "assets/img_05.webp",
    "assets/img_06.webp",
  ];

  List<String> bookPrice = [
    "\$20.00",
    "\$23.00",
    "\$14.00",
    "\$50.00",
    "\$24.00",
    "\$40.00",
  ];

  List<String> bookNames = [
    "Hindi",
    "English",
    "Science",
    "Socialscience",
    "Math",
    "C++",
  ];

  List<String> bookDescription = [
    "Ray Bradbury's dystopian world shines a light on Western societies' dependence."
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => openTheBook());
  }

  void openTheBook() {
    int bookNoIndex = -1;
    if (widget.path != null) {
      bookNoIndex = int.tryParse(widget.path!.substring(5)) ?? -1;
    }

    if (bookNoIndex >= 0 && bookNoIndex < bookImgs.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookDetailsPage(
            bkDescription: bookDescription[bookNoIndex],
            bkImage: bookImgs[bookNoIndex],
            bkName: bookNames[bookNoIndex],
            bkPrice: bookPrice[bookNoIndex],
            bookNo: bookNoIndex,
          ),

        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Book Store t2p->${widget.path ?? ''}',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              String url =
                  'https://www.youtube.com/watch?v=FbLxvPxIF1E&ab_channel=AshishRaturi';
              await Share.share(url);
            },
            child: Row(
              children: [Icon(Icons.share), Text('Share With Friends')],
            ),
          )
        ],
      ),
      body: GridView.builder(
        itemCount: bookImgs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsPage(
                    bkDescription: bookDescription[index],
                    bkImage: bookImgs[index],
                    bkName: bookNames[index],
                    bkPrice: bookPrice[index],
                    bookNo: index,
                  ),
                ),
              );
            },
            child: Card(
              child: Image.asset(
                bookImgs[index],
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
