import 'dart:async';

import 'package:guru_app/User/model/user.dart';
import 'package:guru_app/User/repository/json_api_rest.dart';

class UserBloc {

  User user;
  RestfulApi restfulApi;
  Timer timer;
  //Business Logic Components

  //Case 1: Login in the app

  //Step 1: Send email to web from form
  sendEmailFromForm(){
    var res = restfulApi.sendEmail(user.userEmail);
    if (res == null){
      return null;
    }
      user = User.fromJson(res);
      magicLinkConfirmation();
  }

  //Step 2: Check if the link has been clicked every 5 seconds
  magicLinkConfirmation(){
    var response;

        do {
          timer = Timer.periodic(Duration(seconds: 5), (Timer t) =>{
          response = restfulApi.magicLinkConfirmation(user.token)
          });
        }while(response == null);

    user = User.fromJson(response);

    if(user.authToken!=null){
      return true;
    }else{
      return false;
    }
  }

  //Case 2: New User registration

registerUser(){
    restfulApi.registerUser(user);
}
}
