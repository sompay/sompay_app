import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    // check network status on page load
    checkNetworkStatus();
    // check network status on network change
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        checkNetworkStatus();
      });
    });
  }

  Future<void> checkNetworkStatus() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // no internet connection
      setState(() {
        _isConnected = false;
      });
    } else {
      // internet connection
      setState(() {
        _isConnected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: _isConnected
          ? WebView(
              initialUrl: 'https://account.sompay.so/client/customer_profile/',
              javascriptMode: JavascriptMode.unrestricted,
              // userAgent:
              //     'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
            )
          : Center(
              child: Text(
                  'You are offline. Please check your internet connection and try again.'),
            ),
    );
  }
}
