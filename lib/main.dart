import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewPage(),
    );
  }
}

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
        title: Text('WebView Page'),
      ),
      body: WebView(
        initialUrl: 'https://account.sompay.so/client',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
