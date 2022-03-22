import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Gallery extends StatefulWidget {

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //     iconTheme: IconThemeData(color: Colors.black),
        //     backgroundColor: Colors.white,
        //     title: Center(
        //       child: Text("His's and Her's Gallery", style: TextStyle(fontSize: 16.0,
        //           color: Colors.black
        //       )),
        //     ),
        // ),
        body: const WebView(
          initialUrl: 'https://a1onlinelearning.com/gallery',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
