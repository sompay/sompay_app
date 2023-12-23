import 'package:flutter/material.dart';
import 'package:sompay_app/profile.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final String initialUrl =
      'https://account.sompay.so/client'; // Replace with your desired URL
  late WebViewController webviewController;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WebViewPage()),
      );
    }

    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue,
          centerTitle: true,
          // iconTheme: IconThemeData(
          //   color: Colors.black, // set the color of the icon menu to black
          // ),
          title: Text(
            'SomPay',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),

          leading: InkWell(
            onTap: () async {
              if (await webviewController.canGoBack()) {
                webviewController.goBack();
              } else {
                Navigator.pop(context);
              }
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (await webviewController.canGoBack()) {
              webviewController.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: WebView(
            initialUrl: 'https://account.sompay.so/client',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              webviewController = controller;
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
