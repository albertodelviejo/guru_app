import 'package:flutter/material.dart';
import 'package:guru_app/User/ui/screens/welcome.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: new InputDecorationTheme(
            labelStyle: new TextStyle(color: Colors.white),
            focusColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white), //  when the TextFormField in focused
      ) ,
        ),

      ),
      home: Welcome(),
    );
  }
}

