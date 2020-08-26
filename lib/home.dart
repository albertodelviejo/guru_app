import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guru_app/widgets/drawer_menu.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'User/model/user.dart';

class Home extends StatelessWidget {
  String action = "Home";
  User user;
  String selectedUrl;
  Widget webView = WebView();
  WebViewController _myController;
  bool _loadedPage = false;

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
              onWebViewCreated: (controller){
                _myController = controller;
              },
              onPageFinished: (url) {
                print('Page finished loading: $url');

                Future<String> js = _myController.evaluateJavascript("""({
                        logged_in: window.logged_in,
                        user_name: window.user_name,
                        user_email: window.user_email,
                        user_photo: window.user_photo
                    })""".trim());
                print(js);
              },
            ),
            _loadedPage == false ? new Center(
              child: new CircularProgressIndicator(
                  backgroundColor: Colors.green),
            ): new Container(),
          ],
        )
    );
  }
}