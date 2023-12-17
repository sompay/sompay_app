import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final String initialUrl =
      'https://account.sompay.so/client'; // Replace with your desired URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          // centerTitle: true,
          // iconTheme: IconThemeData(
          //   color: Colors.black, // set the color of the icon menu to black
          // ),
          // title: Text(
          //   'SomPay',
          //   style: TextStyle(
          //       color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          // ),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
        body: WebView(
          initialUrl: 'https://account.sompay.so/client',
          javascriptMode: JavascriptMode.unrestricted,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ));
  }
}
