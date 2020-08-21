import 'package:flutter/material.dart';

class User {
  String email;
  String password;
  bool isLogged;

  User({Key key, @required this.email, @required this.password, @required this.isLogged});
}
