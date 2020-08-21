import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatelessWidget {
  String action = "Home";
  String selectedUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Home({Key key, this.action});

  @override
  Widget build(BuildContext context) {
    switch(action){
      case "LogIn":
        selectedUrl = "https://www.guruwalk.com/login";
        break;
      case "Register":
        selectedUrl = "https://www.guruwalk.com/signup";
        break;
      default:
        selectedUrl = "https://www.guruwalk.com";
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(action),
        backgroundColor: Color(0xFFFF5A5F),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: selectedUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),

        ],
      )
    );
  }
}