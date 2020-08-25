import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guru_app/widgets/drawer_menu.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'User/model/user.dart';

class Home extends StatelessWidget {
  String action = "Home";
  String selectedUrl;
  Widget webView = WebView();
  User user;

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  Home({Key key, this.action, this.user});

  @override
  Widget build(BuildContext context) {

    switch(action){

      case "Bookings":
        selectedUrl = "https://www.guruwalk.com/bookings";
        break;
      case "MyTours":
        selectedUrl = "https://www.guruwalk.com/gurus/${user.userName}";
        break;
      case "Messages":
        selectedUrl = "https://www.guruwalk.com/gurus/${user.userName}/inbox";
        break;
      case "EditProfile":
        selectedUrl = "https://www.guruwalk.com/settings";
        break;
      default:
        selectedUrl = "https://www.guruwalk.com";
        break;
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(action),
          backgroundColor: Color(0xFFFF5A5F),
        ),
        drawer: DrawerMenu(user),
        body:
        Stack(
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