import 'package:flutter/material.dart';

class User {

  final String uid;
  String token;
  String authToken;
  final String userName;
  final String givenName;
  final String userSurname;
  String userEmail;
  final String userPhoto;
  String cityOfResidence;
  final String preferredLanguage;
  String password;
  bool isLoggedIn;

  User({
    Key key,
    this.uid,
    this.token,
    this.authToken,
    this.userName,
    this.givenName,
    this.userSurname,
    @required this.userEmail,
    this.cityOfResidence,
    @required this.password,
    this.userPhoto,
    this.preferredLanguage,
    this.isLoggedIn});

  factory User.fromJson(Map<String, dynamic> parsedJson){
    Map json = parsedJson['data'];
    return User(
        uid: json['id'],
        token: json['token'],
        authToken: json['auth_token'],
        userName: json['username'],
        givenName: json['given_name'],
        userSurname: json['family_name'],
        preferredLanguage: json['locale'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'uid' : uid,
        'user_name': userName,
        'user_email': userEmail,
        'user_photo' : userPhoto,
        'city_of_residence' : cityOfResidence,
        'preferred_language' : preferredLanguage,
        'password' : password,
        'logged_in' : isLoggedIn
      };
}
