import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:guru_app/User/model/query.dart';
import 'package:guru_app/User/model/user.dart';

class RestfulApi  {
  static var uri = "https://www.guruwalk.com/auth_api/";
  Map<String,dynamic> queryParams = {};
  Query query;

  static BaseOptions options = BaseOptions(
      baseUrl: uri,
      responseType: ResponseType.plain,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      validateStatus: (code) {
        if (code >= 200) {
          return true;
        }
      });

  static Dio dio = Dio(options);

  sendEmail(String email){
    queryParams = {"email": email};
    query = Query(type: "POST", params: queryParams,endpoint: "magic_links");
    return doRequest(query);
  }


  loginUser(String email, String password){
    queryParams = {
      "login": email,
      "password": password};
    query = Query(type: "POST", params: queryParams,endpoint: "auth/sign_in");
    return doRequest(query);
  }

  registerUser(User user){
    queryParams = {
      "email": user.userEmail,
      "given_name": user.givenName,
      "family_name": user.userSurname,
      //TODO Implement all the params for Register an User
    };
    query = Query(type: "POST", params: queryParams, endpoint: "api/users");
    return doRequest(query);
  }

  //Comprueba si existe token y el status es true
  checkToken(String token){
    query = Query(type: "GET", params: queryParams, endpoint: "api/magic_links/$token");
    return doRequest(query);
  }

  /*
  - Comprueba si existe el magic link con ese token
  - Se confirma el email asignado a ese token en caso de no estar confirmado
  - Se resetea el auth_token antes de enviarlo
  - Si la request es html, se loguea en el front y redirect to home
  - Si la request es json, devuelve:
  - {object:
      {id: userId,
      email: email,
      auth_token: auth_token}
   */
  magicLinkConfirmation(String token){
    query = Query(type: "GET", params: queryParams, endpoint: "api/magic_link_confirmations/$token");
    return doRequest(query);
  }

  Future<dynamic> doRequest(Query query) async {
    try {
      Options options = Options(
        contentType: 'application/json',
      );

      Response response;

      switch(query.type){
        case "POST":
          response = await dio.post(query.endpoint,
              queryParameters: query.params, options: options);
          break;
        case "GET":
          response = await dio.get(query.endpoint,
              queryParameters: query.params, options: options);
          break;
      }

      print("La respuesta http es ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = json.decode(response.data);
        print(responseJson);
        return responseJson;
      } else if (response.statusCode == 401) {
        throw Exception("Incorrect Email/Password");
      } else if (response.statusCode == 404) {
        return null;
      } else
        throw Exception('Authentication Error');
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        throw Exception("Network Error");
      } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
          exception.type == DioErrorType.CONNECT_TIMEOUT) {
        throw Exception(
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return null;
      }
    }
  }
}