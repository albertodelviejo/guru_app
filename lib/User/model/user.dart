import 'package:flutter/material.dart';

class User {

  final String userName;
  final String userEmail;
  final String userPhoto;
  final bool isLoggedIn;

  User(this.userName, this.userEmail, this.userPhoto, this.isLoggedIn);

  User.fromJson(Map<String, dynamic> json) : userName = json['user_name'], userEmail = json['user_email'], userPhoto = json['user_photo'], isLoggedIn = json['logged_in'];

  Map<String, dynamic> toJson() =>
      {
        'user_name': userName,
        'user_email': userEmail,
        'user_photo' : userPhoto,
        'logged_in' : isLoggedIn
      };
}
