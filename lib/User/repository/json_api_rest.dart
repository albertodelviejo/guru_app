import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

class LoginWithRestfulApi  {
  static var uri = "https://www.guruwalk.com/auth_api/";

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

  Future<dynamic> loginUser(String email, String password) async {
    try {
      Options options = Options(
        contentType: 'application/json',
      );

      Response response = await dio.post('auth/sign_in',
          data: {"login": email, "password": password}, options: options);

      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = json.decode(response.data);
        return responseJson;
      } else if (response.statusCode == 401) {
        throw Exception("Incorrect Email/Password");
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